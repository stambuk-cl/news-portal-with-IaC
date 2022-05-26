resource "google_storage_bucket" "news" {
  name          = "${var.project}-infra-static-pages"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "error.html"
  }
  versioning {
    enabled = "true" ##Add versioning
  }
}

resource "google_storage_bucket_iam_binding" "news" {
  bucket = google_storage_bucket.news.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers" ##Need to change this to a granular permissions or groups 
  ]
}