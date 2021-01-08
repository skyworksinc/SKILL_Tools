# Add SKILL_Tools library
mkdir -p "${PREFIX}/lib/skill/IDS-skill"
for item in "src" "IDS-skill.init.ils" "IDS-skill.lmgrinit" "README.md"; do
	cp -rf "${RECIPE_DIR}/../${item}" \
       "${PREFIX}/lib/skill/IDS-skill"
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

