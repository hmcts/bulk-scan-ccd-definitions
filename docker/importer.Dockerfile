# ---- Base image - order important ----
FROM hmcts/ccd-definition-processor:latest as base

# ----        Runtime image         ----
FROM hmcts/ccd-definition-importer:latest as runtime
RUN apk add --no-cache curl jq zip unzip git
COPY --from=base . .


ARG FILE_NAME
ARG ENV_VAR

RUN echo "file name $FILE_NAME"
ENV FILE_NAME ${FILE_NAME}

ENV ENV_VAR ${ENV_VAR}

COPY ./data /data


CMD source /env/$ENV_VAR"-env-variables.sh" && cp /env/ccd-template.xlsx  /opt/ccd-definition-processor/data/ccd-template.xlsx  && cd /opt/ccd-definition-processor && yarn json2xlsx -D /data/sheets -o /data/${FILE_NAME}.xlsx
