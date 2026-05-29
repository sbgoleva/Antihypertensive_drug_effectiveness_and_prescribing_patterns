#!/bin/bash

#code for safely uploading workbooks from all of us
# NAVIGATE TO FOLDER IN WORKSPACE
cd ~/workspaces/htndementiametaanalysis/

# --- CONFIGURATION ---
REPO_URL="https://github.com/sbgoleva/htn_adrd/"
SOURCE_PATTERN="*.ipynb"       # Where are the files coming from?
# Test SOURCE_PATTERN
ls $SOURCE_PATTERN 
DEST_FOLDER="htn_adrd_notebooks"   # Where do they go in the repo?

# 1. SETUP & INITIALIZE
# ---------------------
echo "Initializing Ghost Repo..."
rm -rf github-link                 # Safety clean of old runs
git clone --depth 1 "$REPO_URL" github-link
cd github-link
git config user.email "slavinag@gmail.com"
git config user.name "sbgoleva"

# 2. PREPARE DIRECTORY
# --------------------
echo "Creating destination folder: $DEST_FOLDER"
mkdir -p "$DEST_FOLDER/ipynb_notebooks"

SOURCE_PATTERN="../*.ipynb"       # Where are the files coming from?

# Copy notebooks to /ipynb_notebooks subfolder and track what we copied
echo "Copying files matching: $SOURCE_PATTERN"
COPIED_FILES=()
for file in $SOURCE_PATTERN; do
    echo $file
    if [ -f "$file" ]; then
        cp "$file" "./$DEST_FOLDER/ipynb_notebooks/"
        COPIED_FILES+=("$(basename "$file")")
        echo "  Copied: $(basename "$file")"
    fi
done

# 3. SAFETY SCRUBBING (CRITICAL)
# ------------------------------
echo "Scrubbing sensitive bucket paths from copied files..."
for file in "${COPIED_FILES[@]}"; do
    sed -i 's|gs://fc-secure-[a-zA-Z0-9_-]*|{bucket or my_bucket}|g' "$DEST_FOLDER/ipynb_notebooks/$file"
done

echo "Scanning for other secrets (Tokens, Keys)..."
for file in "${COPIED_FILES[@]}"; do
    grep -Ei "api_key|token|secret|password|auth" "$DEST_FOLDER/ipynb_notebooks/$file" || true
done

# 4. OUTPUT STRIPPING & CONVERSION
# --------------------------------
echo "Stripping notebook outputs from copied files..."
for file in "${COPIED_FILES[@]}"; do
    jupyter nbconvert --clear-output --inplace "$DEST_FOLDER/ipynb_notebooks/$file"
done

echo "Generating scripts based on notebook type..."
for file in "${COPIED_FILES[@]}"; do
    full_path="$DEST_FOLDER/ipynb_notebooks/$file"

    if [[ "$file" == *_py.ipynb ]]; then
        echo "  Converting $file → Python"
        jupyter nbconvert --to python --output-dir="$DEST_FOLDER" "$full_path"

    elif [[ "$file" == *_r.ipynb ]]; then
        echo "  Converting $file → R"
        jupyter nbconvert --to script --output-dir="$DEST_FOLDER" "$full_path"

        # Rename .txt (default) → .r if needed
        base_name="${file%.ipynb}"
        if [ -f "$DEST_FOLDER/$base_name.txt" ]; then
            mv "$DEST_FOLDER/$base_name.txt" "$DEST_FOLDER/$base_name.r"
        fi
    fi
done

# 5. CLEANUP
# ----------
# Create a local .gitignore so we don't upload pycache junk
echo "__pycache__/" > "$DEST_FOLDER/.gitignore"
echo ".ipynb_checkpoints/" >> "$DEST_FOLDER/.gitignore"

# 6. PUSH TO GITHUB
# -----------------
echo "⬆Syncing with GitHub..."
git add "$DEST_FOLDER"
git commit -m "Upload: Cleaned notebooks + Python exports for AI"
git push origin main
echo "Done! Your clean code is now on GitHub."
