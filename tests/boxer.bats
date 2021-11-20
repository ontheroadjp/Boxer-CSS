#!/usr/bin/env bats

TMP_DIR='tmp_bats'
OUT_FILE_NAME='style.css'

setup() {
    TMP_DIR=$(mktemp -d -t "bats_boxer_")
    #mkdir -p ${TMP_DIR}
}

teardown() {
    rm -rf ${TMP_DIR}
}

@test "Status code is 0 when run sass command" {
    run sass index.scss:${TMP_DIR}/${OUT_FILE_NAME}
    [ "${status}" -eq 0 ]
}

@test "Genarate ${OUT_FILE_NAME} when run sass command" {
    run sass index.scss:${TMP_DIR}/${OUT_FILE_NAME}
    [ -f ${TMP_DIR}/${OUT_FILE_NAME} ]
}

@test "Genarate ${OUT_FILE_NAME}.map when run sass command" {
    run sass index.scss:${TMP_DIR}/${OUT_FILE_NAME}
    [ -f ${TMP_DIR}/${OUT_FILE_NAME}.map ]
}
