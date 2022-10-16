import 'package:awesome_dialog/awesome_dialog.dart' as dialog;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_login/widgets.dart';
import 'package:hesperis_tamuda/models/auth.dart';
import 'package:hesperis_tamuda/models/statut.dart' as auth;
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/loginScreen.dart';
import 'package:hesperis_tamuda/views/pages/navigation_history.dart';
import 'package:hesperis_tamuda/views/pages/user/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'transition_route_observer.dart';
import 'widgets/fade_in.dart';
import 'widgets/round_button.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return Navigator.of(context)
        .pushReplacementNamed('/auth')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  final routeObserver = TransitionRouteObserver<PageRoute?>();
  static const headerAniInterval = Interval(.1, .3, curve: Curves.easeOut);
  late Animation<double> _headerScaleAnimation;
  AnimationController? _loadingController;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );

    _headerScaleAnimation =
        Tween<double>(begin: .6, end: 1).animate(CurvedAnimation(
      parent: _loadingController!,
      curve: headerAniInterval,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute<dynamic>?);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _loadingController!.dispose();
    super.dispose();
  }

  @override
  void didPushAfterTransition() => _loadingController!.forward();

  AppBar _buildAppBar(ThemeData theme) {
    final signOutBtn = IconButton(
      icon: const Icon(FontAwesomeIcons.rightFromBracket),
      color: Colors.white,
      onPressed: () async {
        dialog.AwesomeDialog(
          context: context,
          dialogType: dialog.DialogType.QUESTION,
          headerAnimationLoop: false,
          animType: dialog.AnimType.BOTTOMSLIDE,
          title: 'Log out',
          desc: 'Are you sure to log out ?',
          buttonsTextStyle: const TextStyle(color: Colors.black),
          showCloseIcon: true,
          btnCancelOnPress: () {},
          btnOkOnPress: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove("email");
            prefs.remove("password");
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
          },
        ).show();
      },
    );
    final title = Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: "logo",
              child: Image.asset(
                'assets/images/logo.png',
                filterQuality: FilterQuality.high,
                height: 30,
              ),
            ),
          ),
          Expanded(
            child: HeroText(
              "Hespéris Tamuda",
              tag: "Hespéris Tamuda",
              viewState: ViewState.shrunk,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const Expanded(
            child: SizedBox(width: 20),
          ),
        ],
      ),
    );

    return AppBar(
      actions: <Widget>[
        FadeIn(
          controller: _loadingController,
          offset: .3,
          curve: headerAniInterval,
          fadeDirection: FadeDirection.endToStart,
          child: signOutBtn,
        ),
      ],
      title: title,
      backgroundColor: const Color(0xff3b5998),
      elevation: 0,
      // toolbarTextStyle: TextStle(),
      // textTheme: theme.accentTextTheme,
      // iconTheme: theme.accentIconTheme,
    );
  }

  Widget _buildHeader(ThemeData theme) {
    const accentColor = Color.fromARGB(255, 171, 111, 210);
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    return ScaleTransition(
      scale: _headerScaleAnimation,
      child: FadeIn(
        controller: _loadingController,
        curve: headerAniInterval,
        fadeDirection: FadeDirection.bottomToTop,
        offset: .5,
        child: orientation == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: theme.textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: accentColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                  Text(
                    'User dashboard',
                    style: theme.textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Welcome',
                          style: theme.textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'User dashboard',
                    style: theme.textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildButton(
      {Widget? icon, String? label, required Interval interval}) {
    return RoundButton(
      icon: icon,
      label: label,
      loadingController: _loadingController,
      interval: Interval(
        interval.begin,
        interval.end,
        curve: const ElasticOutCurve(0.42),
      ),
      onPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String email = prefs.getString("email") as String;

        switch (label) {
          case "Profile":
            Auth statut = await getUser(email);
            final name = statut.user.name;
            final emailVerified = statut.user.emailVerifiedAt;
            final uid = statut.user.id;
            final createdAt = statut.user.createdAt;
            final auth.User authenticatedUser = auth.User(
                id: uid,
                name: name,
                email: email,
                emailVerifiedAt: emailVerified,
                createdAt: createdAt);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserProfil(
                user: authenticatedUser,
              ),
            ));

            break;
          case "History":
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NavigationHistory(),
            ));
            break;
          default:
        }
      },
    );
  }

  Widget _buildDashboardGrid() {
    const step = 0.04;
    const aniInterval = 0.75;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    return orientation == Orientation.portrait
        ? GridView.count(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 20,
            ),
            childAspectRatio: .9,
            crossAxisCount: 3,
            children: [
              _buildButton(
                icon: const Icon(FontAwesomeIcons.user),
                label: 'Profile',
                interval: const Interval(0, aniInterval),
              ),
              _buildButton(
                icon: const Icon(FontAwesomeIcons.message),
                label: 'Notifications',
                interval: const Interval(step * 2, aniInterval + step * 2),
              ),
              _buildButton(
                icon: const Icon(FontAwesomeIcons.download),
                label: 'Downloads',
                interval: const Interval(0, aniInterval),
              ),
              _buildButton(
                icon: const Icon(Icons.newspaper),
                label: 'Newsletter',
                interval: const Interval(step, aniInterval + step),
              ),
              _buildButton(
                icon: const Icon(FontAwesomeIcons.clockRotateLeft),
                label: 'History',
                interval: const Interval(step * 2, aniInterval + step * 2),
              ),
              _buildButton(
                icon: const Icon(FontAwesomeIcons.ellipsis),
                label: 'Other',
                interval: const Interval(0, aniInterval),
              ),
              _buildButton(
                icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
                label: 'Search',
                interval: const Interval(step, aniInterval + step),
              ),
              _buildButton(
                icon: const Icon(FontAwesomeIcons.sliders, size: 20),
                label: 'Settings',
                interval: const Interval(step * 2, aniInterval + step * 2),
              ),
            ],
          )
        : Center(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(
                horizontal: 180.0,
                vertical: 15,
              ),
              childAspectRatio: 1,
              crossAxisCount: 4,
              children: [
                _buildButton(
                  icon: const Icon(FontAwesomeIcons.user),
                  label: 'Profile',
                  interval: const Interval(0, aniInterval),
                ),
                _buildButton(
                  icon: const Icon(FontAwesomeIcons.message),
                  label: 'Notifications',
                  interval: const Interval(step * 2, aniInterval + step * 2),
                ),
                _buildButton(
                  icon: const Icon(FontAwesomeIcons.download),
                  label: 'Downloads',
                  interval: const Interval(0, aniInterval),
                ),
                _buildButton(
                  icon: const Icon(Icons.newspaper),
                  label: 'Newsletter',
                  interval: const Interval(step, aniInterval + step),
                ),
                _buildButton(
                  icon: const Icon(FontAwesomeIcons.clockRotateLeft),
                  label: 'History',
                  interval: const Interval(step * 2, aniInterval + step * 2),
                ),
                _buildButton(
                  icon: const Icon(FontAwesomeIcons.ellipsis),
                  label: 'Other',
                  interval: const Interval(0, aniInterval),
                ),
                _buildButton(
                  icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
                  label: 'Search',
                  interval: const Interval(step, aniInterval + step),
                ),
                _buildButton(
                  icon: const Icon(FontAwesomeIcons.sliders, size: 20),
                  label: 'Settings',
                  interval: const Interval(step * 2, aniInterval + step * 2),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () => _goToLogin(context),
      child: SafeArea(
        child: Scaffold(
          drawer: const NavigationDrawerWidget(),
          appBar: _buildAppBar(theme),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromARGB(255, 255, 241, 241),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                Expanded(
                  flex: 2,
                  child: _buildHeader(theme),
                ),
                Expanded(
                  flex: 8,
                  child: ShaderMask(
                    // blendMode: BlendMode.srcOver,
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.clamp,
                        colors: <Color>[
                          Colors.deepPurpleAccent.shade100,
                          Colors.white,
                          Colors.white,
                          Colors.deepPurple.shade200,
                          // Colors.red,
                          // Colors.yellow,
                        ],
                      ).createShader(bounds);
                    },
                    child: _buildDashboardGrid(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
