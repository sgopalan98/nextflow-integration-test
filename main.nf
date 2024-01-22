#!/usr/bin/env nextflow

nextflow.enable.dsl=2

params.gcp_url = '' // Replace with your default GCP URL or keep it empty
params.output_dir = ''

/*
 * Process to download a file from a GCP URL
 */
process DownloadFile {
    tag "Downloading file from GCP"

    input:
    val gcp_url

    output:
    path 'downloaded_file'

    script:
    """
    gsutil cp ${gcp_url} downloaded_file
    """
}

/*
 * Process to count the number of lines in a file and save the result to a file
 */
process CountLines {
    publishDir "${params.output_dir}", mode: 'symlink'
    tag "Counting lines in file"

    input:
    path file_to_count

    output:
    path 'line_count.txt'

    script:
    """
    wc -l ${file_to_count} | awk '{print "no of lines: " \$1}' > line_count.txt
    """
}

/*
 * Workflow definition
 */
workflow {

    // Check if GCP URL is provided
    if (!params.gcp_url) {
        error "No GCP URL provided. Use --gcp_url to specify the file location."
    }

    // Download file from GCP URL
    download = DownloadFile(params.gcp_url)

    // Count the number of lines in the downloaded file and save to a file
    count = CountLines(download)
    count.view()
}
