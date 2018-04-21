FROM google/dart
ONBUILD WORKDIR /app
ONBUILD COPY --from=builder /app/bin/main.snap ./
ONBUILD RUN dart \
    --snapshot=main.snap \
    --snapshot-kind=app-jit \
    main.snap train