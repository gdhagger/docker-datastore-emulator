FROM google/cloud-sdk:alpine

ENV CLOUDSDK_CORE_PROJECT="emulator" \
    DATASTORE_PROJECT_ID="emulator" \
    DATASTORE_DATASET_ID="emulator"

RUN apk --no-cache --update add openjdk8-jre \
 && gcloud components install --quiet cloud-datastore-emulator beta \
 && mkdir -p /var/lib/datastore \
 && rm -fr /var/cache/apk/*

VOLUME /var/lib/datastore

CMD ["/google-cloud-sdk/bin/gcloud", "beta", "emulators", "datastore", "start", "--data-dir=/var/lib/datastore", "--host-port=0.0.0.0:8081"]

