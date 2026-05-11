# Purchase Orders Application

This is a full-stack application for managing purchase orders, built using the SAP Cloud Application Programming (CAP) Model, Node.js, and SAP Fiori.

## Project Structure

This project follows the recommended SAP CAP application layout:

| File or Folder | Purpose                                                                               |
| -------------- | ------------------------------------------------------------------------------------- |
| `app/`         | Contains the UI frontend components (SAP Fiori elements app in `app/purchaseorders`). |
| `db/`          | Contains domain models, data structures, and views (`datamodel.cds`, `cdsviews.cds`). |
| `srv/`         | Contains service definitions and custom logic (`cat-service.cds`, `cat-service.js`).  |
| `package.json` | Project metadata and configuration.                                                   |
| `mta.yaml`     | Multi-Target Application descriptor for deployment to SAP BTP.                        |

## Getting Started

To run the application locally, open a new terminal in the project root and execute:

```bash
cds watch
```

_(In VS Code, you can also choose **Terminal** > Run Task > cds watch)_

This will spin up the CAP server with an in-memory database and serve the OData endpoints alongside the Fiori UI. The terminal will output a localhost URL (usually `http://localhost:4004`) where you can launch the app.

## Learn More

Learn more about SAP CAP at [https://cap.cloud.sap/docs/get-started/](https://cap.cloud.sap/docs/get-started/).
