// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
import ToggleFormController from "./toggle_form_controller";

eagerLoadControllersFrom("controllers", application);
application.register("toggle-form", ToggleFormController);
