array_foreach(activeParticleTypes, function (particleType) {
    if (part_type_exists(particleType)) {
        part_type_destroy(particleType)
    }
})

activeParticleTypes = []