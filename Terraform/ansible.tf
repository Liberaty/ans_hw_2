resource "local_file" "inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    ubuntu      = yandex_compute_instance.ubuntu
  })
  filename = "ansible_inventory.ini"
}

# resource "null_resource" "provision_web" {
#   depends_on = [
#     #yandex_compute_instance.web,
#     local_file.inventory
#   ]

# provisioner "local-exec" {
#     command = "echo 'Inventory file created successfully!'"
#   }

#   triggers = {
#     always_run        = timestamp()                         
#     playbook_src_hash = file("${abspath(path.module)}/playbook.yml") 
#     ssh_public_key    = "ubuntu:${local.ssh_public_key}"                          
#   }
# }