package tech.mrwconsulting.sample;

import software.amazon.awscdk.App;
import software.amazon.awscdk.Environment;
import software.amazon.awscdk.StackProps;

import java.util.Arrays;

public class CdkJavaApp {
    public static void main(final String[] args) {
        App app = new App();

        new CdkJavaStack(app, "cdk-java-stack", StackProps.builder()
                .env(Environment.builder()
                        .region(System.getenv("TARGET_REGION"))
                        .account(System.getenv("TARGET_ACCOUNT"))
                        .build())
                .build());
        app.synth();
    }
}