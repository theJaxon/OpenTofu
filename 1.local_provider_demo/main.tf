resource "local_file" "demo_file" {
  filename = "${path.module}/demo.txt"
  content  = "Demo 1."
}