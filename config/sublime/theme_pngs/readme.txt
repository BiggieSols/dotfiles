# In this dir:
THEME_DIR="/Users/vaughn/Library/Application Support/Sublime Text 2/Packages/Theme - Default/"

# Backup image files
ls |xargs -I foo cp "${THEME_DIR}foo" "${THEME_DIR}foo.backup"

# Copy files over
cp *.png "$THEME_DIR"