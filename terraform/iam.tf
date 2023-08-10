resource "yandex_iam_service_account" "gitlab-sa" {
  name        = "gitlab-runner-service-account"
  description = "A separate sa for managing gitlab runners"
}

resource "yandex_iam_service_account_iam_binding" "gitlab-sa-binding" {
  service_account_id = yandex_iam_service_account.gitlab-sa.id
  role               = "compute.admin"

  members = [
    "serviceAccount:${yandex_iam_service_account.gitlab-sa.id}"
  ]
}
