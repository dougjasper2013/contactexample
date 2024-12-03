import { Component } from '@angular/core';

import { NgForm } from '@angular/forms'

import { Contact } from '../contact';
import { ContactService } from '../contact.service';

import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrl: './contact.component.css'
})
export class ContactComponent {

  title = 'ContactManager';
  contacts: Contact[] = [];
  contact: Contact = {firstName:'', lastName:'', emailAddress:'', phone:'', status:'', dob:'', imageName:''};

  error = '';
  success = '';

  selectedFile: File | null = null;

  constructor(private contactService: ContactService, private http: HttpClient) {

  }

  ngOnInit() {
    this.getContacts();
  }

  getContacts(): void {
    this.contactService.getAll().subscribe(
      (data: Contact[]) => {
        this.contacts = data;
        this.success = 'successful list retrieval';
      },
      (err) => {
        console.log (err);
        this.error = err;
      }
    )
  }

  addContact(f: NgForm) {
    this.resetAlerts();

    this.uploadFile();

    this.contactService.add(this.contact).subscribe(
      (res: Contact) => {
        this.contacts.push(res)
        this.success = 'Successfully created';

        f.reset();
      },
      (err) => (this.error = err.message)
    );
  }

  editContact(firstName: any, lastName: any, emailAddress: any, phone: any, contactID: any) {
    this.resetAlerts();
    console.log(firstName.value);

    this.contactService.edit({firstName: firstName.value, lastName: lastName.value, emailAddress: emailAddress.value, phone: phone.value, contactID: +contactID})
    .subscribe(
      (res) => {        
        this.success = 'Successfully edited';        
      },
      (err) => (this.error = err.message)
    );
  }

  deleteContact(contactID: number) {
    this.resetAlerts();    

    this.contactService.delete(contactID)
    .subscribe(
      (res) => {
        this.contacts = this.contacts.filter( function (item) {
          return item['contactID'] && +item['contactID'] !== +contactID;
                
      });
      this.success = "Deleted successfully";
    },
      (err) => (this.error = err.message)
    );
  }

  onFileSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length > 0) {
      this.selectedFile = input.files[0];
    }
  }

  uploadFile(): void {
    if (!this.selectedFile) {
        return;
    }
    const formData = new FormData();
    formData.append('image', this.selectedFile);

    this.http.post('http://localhost/contactapiam/upload', formData).subscribe(
        response => console.log('File uploaded successfully:', response),
        error => console.error('File upload failed:', error)
    );    
  }

  resetAlerts() {
    this.error = '';
    this.success = '';
  }


}
