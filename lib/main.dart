import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const indigo = Color(0xFF484FA9);
const lavender = Color(0xFFFAF7FF);
const panel = Color(0xFFE9EAF6);
void main() => runApp(const Portfolio());

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Shivani Reddy | Portfolio',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: indigo),
      scaffoldBackgroundColor: lavender,
      appBarTheme: const AppBarTheme(
        backgroundColor: indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: indigo,
          foregroundColor: Colors.white,
          minimumSize: const Size(170, 48),
        ),
      ),
    ),
    routes: {
      '/': (_) => const Home(),
      '/about': (_) => const About(),
      '/projects': (_) => const Projects(),
    },
  );
}

Future<void> openLink(BuildContext context, String target) async {
  try {
    if (await launchUrl(Uri.parse(target))) {
      return;
    }
  } catch (_) {
    /* Explain failure through the UI below. */
  }
  if (context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Could not open $target')));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('My Portfolio')),
    body: LayoutBuilder(
      builder: (context, bounds) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: bounds.maxHeight),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundColor: Color(0xFFE7DDFC),
                    child: Text(
                      'SR',
                      style: TextStyle(
                        fontSize: 48,
                        color: indigo,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  const Text(
                    'Kondla Shivani Reddy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: indigo,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'B.Tech • Artificial Intelligence & Machine Learning',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Prompt Engineering / Generative AI',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: indigo),
                  ),
                  const SizedBox(height: 32),
                  FilledButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/about'),
                    icon: const Icon(Icons.person_outline, size: 18),
                    label: const Text('About Me'),
                  ),
                  const SizedBox(height: 14),
                  FilledButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/projects'),
                    icon: const Icon(Icons.folder_outlined, size: 18),
                    label: const Text('Projects'),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children: [
                      TextButton(
                        onPressed: () =>
                            openLink(context, 'mailto:sr8223953@gmail.com'),
                        child: const Text('Email'),
                      ),
                      TextButton(
                        onPressed: () => openLink(
                          context,
                          'https://www.linkedin.com/in/k-shivani-reddy',
                        ),
                        child: const Text('LinkedIn'),
                      ),
                      TextButton(
                        onPressed: () => openLink(
                          context,
                          'https://github.com/ShivaniReddy-4',
                        ),
                        child: const Text('GitHub'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class PageShell extends StatelessWidget {
  final String title;
  final Widget child;
  const PageShell({super.key, required this.title, required this.child});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            children: [
              child,
              const SizedBox(height: 28),
              FilledButton(
                onPressed: () =>
                    Navigator.popUntil(context, ModalRoute.withName('/')),
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget heading(String text) => Padding(
  padding: const EdgeInsets.only(top: 24, bottom: 14),
  child: Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      color: indigo,
    ),
  ),
);
Widget chips(List<String> values) => Wrap(
  alignment: WrapAlignment.center,
  spacing: 8,
  runSpacing: 8,
  children: values
      .map(
        (s) => Chip(
          label: Text(s, style: const TextStyle(color: Colors.white)),
          backgroundColor: indigo,
          side: BorderSide.none,
          shape: const StadiumBorder(),
        ),
      )
      .toList(),
);
Widget detail(String title, String text) => Padding(
  padding: const EdgeInsets.only(bottom: 16),
  child: Column(
    children: [
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      const SizedBox(height: 5),
      Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(height: 1.6),
      ),
    ],
  ),
);

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'About Me',
    child: Card(
      color: panel,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            const Icon(Icons.person, color: indigo, size: 52),
            const SizedBox(height: 24),
            const Text(
              "Hello! I'm Kondla Shivani Reddy, an AI/ML undergraduate at C.R. Rao Advanced Institute of Mathematics, Statistics and Computer Science with a 9.405 CGPA. I have a strong Python foundation and hands-on learning in LLMs, prompt engineering, RAG pipelines and generative AI. I'm interested in building measurable, reliable LLM workflows and AI applications.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, height: 1.65),
            ),
            heading('Skills & Expertise'),
            chips([
              'Python',
              'C',
              'Prompt Engineering',
              'Generative AI',
              'RAG Pipelines',
              'LLM Fundamentals',
              'Scikit-learn',
              'Pandas',
              'NumPy',
              'Matplotlib',
              'Seaborn',
              'Jupyter',
              'Google Colab',
              'GitHub',
            ]),
            heading('Education'),
            detail(
              'B.Tech • Artificial Intelligence & Machine Learning',
              'C.R. Rao Advanced Institute of Mathematics, Statistics and Computer Science\n2024–Present • CGPA: 9.405',
            ),
            detail('Class XII • Narayana Junior College', '2024 • 94%'),
            heading('Training'),
            detail(
              'Programming Master: Generative AI Program • Edureka',
              'Ongoing • LLMs, prompt engineering, RAG pipelines and AI application development',
            ),
            detail(
              'AI & ML Program • IIIT Hyderabad (iHub-Data)',
              'Ongoing • Machine learning, data analysis and practical Python implementation',
            ),
            heading('Certifications'),
            detail('Google AI Essentials', 'Coursera'),
            detail(
              'IBM SkillsBuild',
              'Introduction to Large Language Models\nGenerative AI for Software Development\nIntelligent by Design: Build an AI Agent',
            ),
            detail('TCS iON Career Edge – Young Professional', 'Ongoing'),
          ],
        ),
      ),
    ),
  );
}

class Projects extends StatelessWidget {
  const Projects({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'My Projects',
    child: Column(
      children: const [
        ProjectCard(
          icon: Icons.school_outlined,
          title: 'Student Performance Prediction System',
          description:
              'Predicts academic performance using study hours, attendance and previous exam scores. Includes data preprocessing, feature engineering and Linear Regression, evaluated with MAE, MSE and R². Built a real-time prediction and visualization interface and explored Streamlit for delivery.',
          tags: [
            'Python',
            'Scikit-learn',
            'Linear Regression',
            'Streamlit exposure',
          ],
        ),
        ProjectCard(
          icon: Icons.auto_awesome_outlined,
          title: 'Generative AI Learning Portfolio',
          description:
              'Ongoing practice in prompt engineering, RAG pipelines and generative AI application development through an industry-oriented program. Exploring LLMs and agents with clear task instructions, reliable outputs and deployment considerations.',
          tags: [
            'Prompt Engineering',
            'RAG',
            'Generative AI',
            'Ongoing learning',
          ],
        ),
        ProjectCard(
          icon: Icons.directions_car_outlined,
          title: 'Car Price Prediction',
          description:
              'Collaborated on dataset exploration, cleaning, preprocessing, visualization and testing of a regression model in Python.',
          tags: ['Python', 'Data Analysis', 'Regression'],
        ),
        ProjectCard(
          icon: Icons.local_florist_outlined,
          title: 'Iris Flower Classification',
          description:
              'Analyzed feature relationships, implemented a Scikit-learn classification model and evaluated predictions using train/test accuracy.',
          tags: ['Scikit-learn', 'Classification', 'Model Evaluation'],
        ),
      ],
    ),
  );
}

class ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title, description;
  final List<String> tags;
  const ProjectCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.tags,
  });
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      color: panel,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: LayoutBuilder(
        builder: (context, bounds) {
          final compact = bounds.maxWidth < 560;
          final visual = Container(
            width: compact ? double.infinity : 120,
            height: compact ? 92 : 240,
            color: indigo,
            child: Icon(icon, color: Colors.white, size: 48),
          );
          final content = Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: indigo,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15, height: 1.6),
                ),
                const SizedBox(height: 18),
                chips(tags),
              ],
            ),
          );
          return compact
              ? Column(children: [visual, content])
              : Row(
                  children: [
                    visual,
                    Expanded(child: content),
                  ],
                );
        },
      ),
    ),
  );
}
