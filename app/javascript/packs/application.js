import "bootstrap";
import { categoryClicker } from "./plugins/add";
import { changePlace } from "./plugins/change";
import { someChange } from "./plugins/subscriptionIndex";
// import { stickyNavigation } from "./plugins/navbar";
import { createNotification } from "./plugins/notification";

import { ecritureHome } from "./plugins/bannerHome";




categoryClicker();
changePlace();
someChange();
// stickyNavigation();
createNotification();
ecritureHome();

