
FROM openmrs/openmrs-core:2.8.5

COPY ./target/distro/web/openmrs_core/openmrs.war /openmrs/distribution/openmrs_core/
COPY ./target/distro/web/openmrs-distro.properties /openmrs/distribution/
COPY ./target/distro/web/openmrs_modules /openmrs/distribution/openmrs_modules
COPY ./target/distro/web/openmrs_owas /openmrs/distribution/openmrs_owas
COPY ./target/distro/web/openmrs_config /openmrs/distribution/openmrs_config
COPY ./target/distro/web/openmrs_spa /openmrs/distribution/openmrs_spa