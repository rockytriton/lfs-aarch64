#include <stdio.h>
#include <yaml.h>

int main(int argc, char **argv) {
    if (argc < 3) {
        fputs("Usage: pck-read <file> <field>\n", stderr);
        return -1;
    }

    FILE *f = fopen(argv[1], "r");
    yaml_parser_t parser;
    yaml_token_t token;

    if (!yaml_parser_initialize(&parser)) {
        fputs("Failed to init libyaml!\n", stderr);
        return -1;
    }

    if (f == NULL) {
        fprintf(stderr, "Invalid file: %s\n", argv[1]);
        return -1;
    }

    yaml_parser_set_input_file(&parser, f);

    int state = 0;
    char token_name[255];
    char token_value[1024];

    int done = 0;
    int found = 0;
    int in_array = 0;

    do {
        yaml_parser_scan(&parser, &token);

        switch(token.type) {
            case YAML_KEY_TOKEN: 
                state = 0; break;
            case YAML_VALUE_TOKEN: 
                state = 1; break;
            case YAML_SCALAR_TOKEN: {
                token_value[0] = 0;
                strncat(token_value, token.data.scalar.value, 1024);

                if (state == 0) {
                    if (!strcmp(token_value, argv[2])) {
                        found = 1;

                        if (!strcmp(token_value, "dependencies")) {
                            in_array = 1;
                        }
                    }
                    else {
                        if (found) {
                            done = 1;
                        }
                    }
                } else {
                    if (found) {
                        fprintf(stdout, "%s\n", token_value);
                    }
                }
            }
            default: break;
        }

        if (token.type != YAML_STREAM_END_TOKEN) {
            yaml_token_delete(&token);
        }

        if (done) {
            break;
        }
    } while(token.type != YAML_STREAM_END_TOKEN);

    yaml_token_delete(&token);
    yaml_parser_delete(&parser);
    fclose(f);

    return 0;
}