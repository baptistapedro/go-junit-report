FROM golang:1.19.1-buster as go-target
ADD . /go-junit-report
WORKDIR /go-junit-report
RUN go build

FROM golang:1.19.1-buster
COPY --from=go-target /go-junit-report/go-junit-report /
COPY --from=go-target /go-junit-report/testdata/*.txt /testsuite/

ENTRYPOINT []
CMD ["/go-junit-report", "-in", "@@"]
