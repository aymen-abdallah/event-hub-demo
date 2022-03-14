spring:
  cloud:
    azure:
      eventhub:
        connection-string: Endpoint=sb://my-test-space.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=2T39p0kBNm63OmCLWQFcbjbWFII0kSyMU85s4AF0wNE=
        checkpoint-storage-account: aymendemo2022
        checkpoint-access-key: O7pNVWCV4UUDrblNEvhvF9iFqmtFF+PhsI2nkFGuwhTvZV7J1w9/rN7QRsyOKg0cD2g2EUm01oCVo/7VML9Ang==
        checkpoint-container: aymendemo2022container
    stream:
#      binders:
#        eventhub1:
#          type: kafka
#          defaultCandidate: false
#          environment:
#            spring:
#              kafka:
#                bootstrap-servers: my-test-space.servicebus.windows.net:9093
#                properties:
#                  sasl.jaas.config: org.apache.kafka.common.security.plain.PlainLoginModule required username="$ConnectionString" password="Endpoint=sb://my-test-space.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=2T39p0kBNm63OmCLWQFcbjbWFII0kSyMU85s4AF0wNE=";
#                  sasl.mechanism: PLAIN
#                  security.protocol: SASL_SSL
#      kafka:
#        binder:
#          brokers: my-test-space.servicebus.windows.net:9093
#          configuration:
#            sasl:
#              jaas:
#                config: org.apache.kafka.common.security.plain.PlainLoginModule required username="$ConnectionString" password="Endpoint=sb://my-test-space.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=2T39p0kBNm63OmCLWQFcbjbWFII0kSyMU85s4AF0wNE=";
#              mechanism: PLAIN
#            security:
#              protocol: SASL_SSL
      bindings:
        consume-in-0:
          destination: aymen-test-hub
          group: $Default
        supply-out-0:
          destination: aymen-test-hub
      eventhub:
        bindings:
          consume-in-0:
            consumer:
              checkpoint-mode: MANUAL
      function:
        definition: consume;supply;
      poller:
        initial-delay: 0
        fixed-delay: 1000
