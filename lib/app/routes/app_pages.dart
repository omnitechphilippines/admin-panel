// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/advance_ui/bindings/advance_ui_binding.dart';
import '../modules/advance_ui/rating/bindings/rating_binding.dart';
import '../modules/advance_ui/rating/views/rating_view.dart';
import '../modules/advance_ui/scrollbar/bindings/scrollbar_binding.dart';
import '../modules/advance_ui/scrollbar/views/scrollbar_view.dart';
import '../modules/advance_ui/sweet_alert/bindings/sweet_alert_binding.dart';
import '../modules/advance_ui/sweet_alert/views/sweet_alert_view.dart';
import '../modules/advance_ui/views/advance_ui_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/lock/bindings/lock_binding.dart';
import '../modules/auth/lock/views/lock_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/reset_password/bindings/reset_password_binding.dart';
import '../modules/auth/reset_password/views/reset_password_view.dart';
import '../modules/auth/sign_up/bindings/sign_up_binding.dart';
import '../modules/auth/sign_up/views/sign_up_view.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/base_ui/accordion/bindings/accordion_binding.dart';
import '../modules/base_ui/accordion/views/accordion_view.dart';
import '../modules/base_ui/alert/bindings/alert_binding.dart';
import '../modules/base_ui/alert/views/alert_view.dart';
import '../modules/base_ui/avatar/bindings/avatar_binding.dart';
import '../modules/base_ui/avatar/views/avatar_view.dart';
import '../modules/base_ui/badge/bindings/badge_binding.dart';
import '../modules/base_ui/badge/views/badge_view.dart';
import '../modules/base_ui/bindings/base_ui_binding.dart';
import '../modules/base_ui/breadcrumb/bindings/breadcrumb_binding.dart';
import '../modules/base_ui/breadcrumb/views/breadcrumb_view.dart';
import '../modules/base_ui/button/bindings/button_binding.dart';
import '../modules/base_ui/button/views/button_view.dart';
import '../modules/base_ui/card/bindings/card_binding.dart';
import '../modules/base_ui/card/views/card_view.dart';
import '../modules/base_ui/carousel/bindings/carousel_binding.dart';
import '../modules/base_ui/carousel/views/carousel_view.dart';
import '../modules/base_ui/collapse/bindings/collapse_binding.dart';
import '../modules/base_ui/collapse/views/collapse_view.dart';
import '../modules/base_ui/dropdown/bindings/dropdown_binding.dart';
import '../modules/base_ui/dropdown/views/dropdown_view.dart';
import '../modules/base_ui/list_group/bindings/list_group_binding.dart';
import '../modules/base_ui/list_group/views/list_group_view.dart';
import '../modules/base_ui/modal/bindings/modal_binding.dart';
import '../modules/base_ui/modal/views/modal_view.dart';
import '../modules/base_ui/pagination/bindings/pagination_binding.dart';
import '../modules/base_ui/pagination/views/pagination_view.dart';
import '../modules/base_ui/placeholder/bindings/placeholder_binding.dart';
import '../modules/base_ui/placeholder/views/placeholder_view.dart';
import '../modules/base_ui/progress/bindings/progress_binding.dart';
import '../modules/base_ui/progress/views/progress_view.dart';
import '../modules/base_ui/spinner/bindings/spinner_binding.dart';
import '../modules/base_ui/spinner/views/spinner_view.dart';
import '../modules/base_ui/tab/bindings/tabs_binding.dart';
import '../modules/base_ui/tab/views/tabs_view.dart';
import '../modules/base_ui/toast/bindings/toast_binding.dart';
import '../modules/base_ui/toast/views/toast_view.dart';
import '../modules/base_ui/tooltip/bindings/tooltip_binding.dart';
import '../modules/base_ui/tooltip/views/tooltip_view.dart';
import '../modules/base_ui/views/base_ui_view.dart';
import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/integration/bindings/integration_binding.dart';
import '../modules/calendar/integration/views/integration_view.dart';
import '../modules/calendar/schedule/bindings/schedule_binding.dart';
import '../modules/calendar/schedule/views/schedule_view.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/charts/bindings/charts_binding.dart';
import '../modules/charts/views/charts_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/email/bindings/email_binding.dart';
import '../modules/email/views/email_view.dart';
import '../modules/forms/basic_element/bindings/basic_element_binding.dart';
import '../modules/forms/basic_element/views/basic_element_view.dart';
import '../modules/forms/bindings/forms_binding.dart';
import '../modules/forms/checkbox_radio/bindings/checkbox_radio_binding.dart';
import '../modules/forms/checkbox_radio/views/checkbox_radio_view.dart';
import '../modules/forms/editor/bindings/editor_binding.dart';
import '../modules/forms/editor/views/editor_view.dart';
import '../modules/forms/file_upload/bindings/file_upload_binding.dart';
import '../modules/forms/file_upload/views/file_upload_view.dart';
import '../modules/forms/form_mask/bindings/form_mask_binding.dart';
import '../modules/forms/form_mask/views/form_mask_view.dart';
import '../modules/forms/slider/bindings/slider_binding.dart';
import '../modules/forms/slider/views/slider_view.dart';
import '../modules/forms/validation/bindings/validation_binding.dart';
import '../modules/forms/validation/views/validation_view.dart';
import '../modules/forms/views/forms_view.dart';
import '../modules/forms/wizard/bindings/wizard_binding.dart';
import '../modules/forms/wizard/views/wizard_view.dart';
import '../modules/icons/bindings/icons_binding.dart';
import '../modules/icons/views/icons_view.dart';
import '../modules/invoice/bindings/invoice_binding.dart';
import '../modules/invoice/details/bindings/details_binding.dart';
import '../modules/invoice/details/views/details_view.dart';
import '../modules/invoice/list/bindings/list_binding.dart';
import '../modules/invoice/list/views/list_view.dart';
import '../modules/invoice/views/invoice_view.dart';
import '../modules/maps/bindings/maps_binding.dart';
import '../modules/maps/views/maps_view.dart';
import '../modules/pages/bindings/pages_binding.dart';
import '../modules/pages/coming_soon/bindings/coming_soon_binding.dart';
import '../modules/pages/coming_soon/views/coming_soon_view.dart';
import '../modules/pages/faqs/bindings/faqs_binding.dart';
import '../modules/pages/faqs/views/faqs_view.dart';
import '../modules/pages/maintenance/bindings/maintenance_binding.dart';
import '../modules/pages/maintenance/views/maintenance_view.dart';
import '../modules/pages/not_found/bindings/not_found_binding.dart';
import '../modules/pages/not_found/views/not_found_view.dart';
import '../modules/pages/pricing/bindings/pricing_binding.dart';
import '../modules/pages/pricing/views/pricing_view.dart';
import '../modules/pages/timeline/bindings/timeline_binding.dart';
import '../modules/pages/timeline/views/timeline_view.dart';
import '../modules/pages/views/pages_view.dart';
import '../modules/tables/basic/bindings/basic_binding.dart';
import '../modules/tables/basic/views/basic_view.dart';
import '../modules/tables/bindings/tables_binding.dart';
import '../modules/tables/views/tables_view.dart';
import '../modules/todo/bindings/todo_binding.dart';
import '../modules/todo/views/todo_view.dart';
import '../modules/widgets/bindings/widgets_binding.dart';
import '../modules/widgets/views/widgets_view.dart';
import 'app_middlewares.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.AUTH;

  static final List<GetPage<Object>> routes = <GetPage<Object>>[
    GetPage<Object>(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      middlewares: <GetMiddleware>[AuthRedirectMiddleware()],
      children: <GetPage<Object>>[
        GetPage<Object>(name: _Paths.LOGIN, page: () => const LoginView(), binding: LoginBinding(), middlewares: <GetMiddleware>[GuestMiddleware()]),
        GetPage<Object>(name: _Paths.RESET_PASSWORD, page: () => const ResetPasswordView(), binding: ResetPasswordBinding(), middlewares: <GetMiddleware>[GuestMiddleware()]),
        GetPage<Object>(name: _Paths.SIGN_UP, page: () => const SignUpView(), binding: SignUpBinding(), middlewares: <GetMiddleware>[GuestMiddleware()]),
        GetPage<Object>(name: _Paths.LOCK, page: () => const LockView(), binding: LockBinding(), middlewares: <GetMiddleware>[GuestMiddleware()]),
      ],
    ),
    GetPage<Object>(name: _Paths.DASHBOARD, page: () => const DashboardView(), binding: DashboardBinding(), middlewares: <GetMiddleware>[AuthMiddleware()]),
    GetPage<Object>(name: _Paths.CHAT, page: () => const ChatView(), binding: ChatBinding()),
    GetPage<Object>(name: _Paths.EMAIL, page: () => const EmailView(), binding: EmailBinding()),
    GetPage<Object>(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
      middlewares: <GetMiddleware>[CalendarRedirectMiddleware()],
      children: <GetPage<Object>>[
        GetPage<Object>(name: _Paths.SCHEDULE, page: () => const ScheduleView(), binding: ScheduleBinding()),
        GetPage<Object>(name: _Paths.INTEGRATION, page: () => const IntegrationView(), binding: IntegrationBinding()),
      ],
    ),
    GetPage<Object>(name: _Paths.TODO, page: () => const TodoView(), binding: TodoBinding()),
    GetPage<Object>(
      name: _Paths.INVOICE,
      page: () => const InvoiceView(),
      binding: InvoiceBinding(),
      middlewares: <GetMiddleware>[InvoiceRedirectMiddleware()],
      children: <GetPage<Object>>[
        GetPage<Object>(name: _Paths.LIST, page: () => const ListView(), binding: ListBinding()),
        GetPage<Object>(name: _Paths.DETAILS, page: () => const DetailsView(), binding: DetailsBinding()),
      ],
    ),
    GetPage<Object>(
      name: _Paths.PAGES,
      page: () => const PagesView(),
      binding: PagesBinding(),
      middlewares: <GetMiddleware>[PagesRedirectMiddleware()],
      children: <GetPage<Object>>[
        GetPage<Object>(name: _Paths.COMING_SOON, page: () => const ComingSoonView(), binding: ComingSoonBinding()),
        GetPage<Object>(name: _Paths.FAQS, page: () => const FaqsView(), binding: FaqsBinding()),
        GetPage<Object>(name: _Paths.MAINTENANCE, page: () => const MaintenanceView(), binding: MaintenanceBinding()),
        GetPage<Object>(name: _Paths.NOT_FOUND, page: () => const NotFoundView(), binding: NotFoundBinding()),
        GetPage<Object>(name: _Paths.PRICING, page: () => const PricingView(), binding: PricingBinding()),
        GetPage<Object>(name: _Paths.TIMELINE, page: () => const TimelineView(), binding: TimelineBinding()),
      ],
    ),
    GetPage<Object>(name: _Paths.WIDGETS, page: () => const WidgetsView(), binding: WidgetsBinding()),
    GetPage<Object>(
      name: _Paths.BASE_UI,
      page: () => const BaseUiView(),
      binding: BaseUiBinding(),
      middlewares: <GetMiddleware>[BaseUiRedirectMiddleware()],
      children: <GetPage<Object>>[
        GetPage<Object>(name: _Paths.ACCORDION, page: () => const AccordionView(), binding: AccordionBinding()),
        GetPage<Object>(name: _Paths.ALERT, page: () => const AlertView(), binding: AlertBinding()),
        GetPage<Object>(name: _Paths.AVATAR, page: () => const AvatarView(), binding: AvatarBinding()),
        GetPage<Object>(name: _Paths.BADGE, page: () => const BadgeView(), binding: BadgeBinding()),
        GetPage<Object>(name: _Paths.BREADCRUMB, page: () => const BreadcrumbView(), binding: BreadcrumbBinding()),
        GetPage<Object>(name: _Paths.BUTTON, page: () => const ButtonView(), binding: ButtonBinding()),
        GetPage<Object>(name: _Paths.CARD, page: () => const CardView(), binding: CardBinding()),
        GetPage<Object>(name: _Paths.CAROUSEL, page: () => const CarouselView(), binding: CarouselBinding()),
        GetPage<Object>(name: _Paths.COLLAPSE, page: () => const CollapseView(), binding: CollapseBinding()),
        GetPage<Object>(name: _Paths.DROPDOWN, page: () => DropdownView(), binding: DropdownBinding()),
        GetPage<Object>(name: _Paths.LIST_GROUP, page: () => const ListGroupView(), binding: ListGroupBinding()),
        GetPage<Object>(name: _Paths.MODAL, page: () => const ModalView(), binding: ModalBinding()),
        GetPage<Object>(name: _Paths.PAGINATION, page: () => const PaginationView(), binding: PaginationBinding()),
        GetPage<Object>(name: _Paths.PLACEHOLDER, page: () => const PlaceholderView(), binding: PlaceholderBinding()),
        GetPage<Object>(name: _Paths.PROGRESS, page: () => const ProgressView(), binding: ProgressBinding()),
        GetPage<Object>(name: _Paths.SPINNER, page: () => const SpinnerView(), binding: SpinnerBinding()),
        GetPage<Object>(name: _Paths.TABS, page: () => const TabsView(), binding: TabsBinding()),
        GetPage<Object>(name: _Paths.TOAST, page: () => const ToastView(), binding: ToastBinding()),
        GetPage<Object>(name: _Paths.TOOLTIP, page: () => const TooltipView(), binding: TooltipBinding()),
      ],
    ),
    GetPage<Object>(
      name: _Paths.ADVANCE_UI,
      page: () => const AdvanceUiView(),
      binding: AdvanceUiBinding(),
      middlewares: <GetMiddleware>[AdvanceUiRedirectMiddleware()],
      children: <GetPage<Object>>[
        GetPage<Object>(name: _Paths.RATING, page: () => const RatingView(), binding: RatingBinding()),
        GetPage<Object>(name: _Paths.SWEET_ALERT, page: () => const SweetAlertView(), binding: SweetAlertBinding()),
        GetPage<Object>(name: _Paths.SCROLLBAR, page: () => const ScrollbarView(), binding: ScrollbarBinding()),
        GetPage<Object>(name: _Paths.ACCORDION, page: () => const AccordionView(), binding: AccordionBinding()),
      ],
    ),
    GetPage<Object>(name: _Paths.CHARTS, page: () => const ChartsView(), binding: ChartsBinding()),
    GetPage<Object>(
      name: _Paths.FORMS,
      page: () => const FormsView(),
      binding: FormsBinding(),
      middlewares: <GetMiddleware>[FormsRedirectMiddleware()],
      children: <GetPage<Object>>[
        GetPage<Object>(name: _Paths.BASIC_ELEMENT, page: () => const BasicElementView(), binding: BasicElementBinding()),
        GetPage<Object>(name: _Paths.CHECKBOX_RADIO, page: () => const CheckboxRadioView(), binding: CheckboxRadioBinding()),
        GetPage<Object>(name: _Paths.EDITOR, page: () => const EditorView(), binding: EditorBinding()),
        GetPage<Object>(name: _Paths.FILE_UPLOAD, page: () => const FileUploadView(), binding: FileUploadBinding()),
        GetPage<Object>(name: _Paths.FORM_MASK, page: () => const FormMaskView(), binding: FormMaskBinding()),
        GetPage<Object>(name: _Paths.SLIDER, page: () => const SliderView(), binding: SliderBinding()),
        GetPage<Object>(name: _Paths.VALIDATION, page: () => const ValidationView(), binding: ValidationBinding()),
        GetPage<Object>(name: _Paths.WIZARD, page: () => const WizardView(), binding: WizardBinding()),
      ],
    ),
    GetPage<Object>(
      name: _Paths.TABLES,
      page: () => const TablesView(),
      binding: TablesBinding(),
      middlewares: <GetMiddleware>[TablesRedirectMiddleware()],
      children: <GetPage<Object>>[GetPage<Object>(name: _Paths.BASIC, page: () => const BasicView(), binding: BasicBinding())],
    ),
    GetPage<Object>(name: _Paths.ICONS, page: () => const IconsView(), binding: IconsBinding()),
    GetPage<Object>(name: _Paths.MAPS, page: () => const MapsView(), binding: MapsBinding()),
    // GetPage<Object>(name: '/:catchAll(.*)', page: () => const NotFoundView(), binding: NotFoundBinding()),
  ];
}
