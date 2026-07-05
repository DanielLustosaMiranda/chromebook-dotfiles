#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
    FILE *fp;
    char buffer[128];

    // Run the original script and get output
    fp = popen("/usr/share/i3blocks/cpu_usage", "r");
    if (fp == NULL) {
        perror("popen failed");
        return 1;
    }

    // Read first line
    if (fgets(buffer, sizeof(buffer), fp) == NULL) {
        perror("fgets failed");
        pclose(fp);
        return 1;
    }
    pclose(fp);

    // Remove '%' if present
    char *percent = strchr(buffer, '%');
    if (percent) *percent = '\0';

    // Convert to float
    double value = atof(buffer);

    // Print as integer percentage
    printf("%.0f%%\n", value);

    return 0;
}
