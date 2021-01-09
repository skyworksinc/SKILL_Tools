# Add SKILL_Tools library
mkdir -p "${PREFIX}/lib/skill/${PKG_NAME}"
for item in "src" "init.ils" "readme.md"; do
	cp -rf "${RECIPE_DIR}/../${item}" \
       "${PREFIX}/lib/skill/${PKG_NAME}"
done

# Copy the [de]activate scripts to $PREFIX/etc/conda/[de]activate.d.
# This will allow them to be run on environment activation.
for CHANGE in "activate" "deactivate"; do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/${CHANGE}.sh" \
       "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
    cp "${RECIPE_DIR}/${CHANGE}.csh" \
       "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.csh"
done

# Build documentation and add it to the conda env
cd docs
make html
mkdir -p "${PREFIX}/docs/${PKG_NAME}"
cp -rf build/html \
   "${PREFIX}/docs/${PKG_NAME}/"
