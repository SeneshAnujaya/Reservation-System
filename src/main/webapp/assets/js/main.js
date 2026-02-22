//
// document.addEventListener("DOMContentLoaded", function () {
//     let currentDeleteId = 0; // Store the reservation ID to delete
//
//     // Show modal
//     function showDeleteModal(id) {
//         currentDeleteId = id;
//         document.getElementById("deleteModal").style.display = "block";
//     }
//
//     // Close modal
//     function closeModal() {
//         document.getElementById("deleteModal").style.display = "none";
//     }
//
//     // Confirm delete
//     document.getElementById("confirmDelete").addEventListener("click", function() {
//         // Redirect to delete servlet
//         window.location.href = `${window.location.origin}/OceanViewResort/delete-reservation?id=${currentDeleteId}`;
//     });
// })
//
