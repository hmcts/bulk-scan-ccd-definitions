# ---- Base image - order important ----
FROM hmcts/ccd-definition-processor:latest as base

# ----        Runtime image         ----
FROM hmcts/ccd-definition-importer:latest as runtime
RUN apk add --no-cache curl jq zip unzip git
COPY --from=base . .
COPY ./data /data


ARG FILE_NAME
RUN echo "file name $FILE_NAME"
ENV FILE_NAME ${FILE_NAME}

CMD cd /opt/ccd-definition-processor && yarn json2xlsx -D /data/sheets -o /data/${FILE_NAME}.xlsx
