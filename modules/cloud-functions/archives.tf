# Automatically zip function source code with shared dependencies
data "archive_file" "create_function" {
  type        = "zip"
  output_path = "${path.root}/.terraform/tmp/create-function.zip"

  source {
    content  = file("${path.root}/functions/create/main.py")
    filename = "main.py"
  }

  source {
    content  = file("${path.root}/functions/shared/requirements.txt")
    filename = "requirements.txt"
  }
}

data "archive_file" "read_function" {
  type        = "zip"
  output_path = "${path.root}/.terraform/tmp/read-function.zip"

  source {
    content  = file("${path.root}/functions/read/main.py")
    filename = "main.py"
  }

  source {
    content  = file("${path.root}/functions/shared/requirements.txt")
    filename = "requirements.txt"
  }
}

data "archive_file" "update_function" {
  type        = "zip"
  output_path = "${path.root}/.terraform/tmp/update-function.zip"

  source {
    content  = file("${path.root}/functions/update/main.py")
    filename = "main.py"
  }

  source {
    content  = file("${path.root}/functions/shared/requirements.txt")
    filename = "requirements.txt"
  }
}

data "archive_file" "delete_function" {
  type        = "zip"
  output_path = "${path.root}/.terraform/tmp/delete-function.zip"

  source {
    content  = file("${path.root}/functions/delete/main.py")
    filename = "main.py"
  }

  source {
    content  = file("${path.root}/functions/shared/requirements.txt")
    filename = "requirements.txt"
  }
}

# Upload function source code to GCS
resource "google_storage_bucket_object" "create_function" {
  name   = "create-function-${data.archive_file.create_function.output_md5}.zip"
  bucket = google_storage_bucket.functions_bucket.name
  source = data.archive_file.create_function.output_path
}

resource "google_storage_bucket_object" "read_function" {
  name   = "read-function-${data.archive_file.read_function.output_md5}.zip"
  bucket = google_storage_bucket.functions_bucket.name
  source = data.archive_file.read_function.output_path
}

resource "google_storage_bucket_object" "update_function" {
  name   = "update-function-${data.archive_file.update_function.output_md5}.zip"
  bucket = google_storage_bucket.functions_bucket.name
  source = data.archive_file.update_function.output_path
}

resource "google_storage_bucket_object" "delete_function" {
  name   = "delete-function-${data.archive_file.delete_function.output_md5}.zip"
  bucket = google_storage_bucket.functions_bucket.name
  source = data.archive_file.delete_function.output_path
}
