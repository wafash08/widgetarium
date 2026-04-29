import 'package:flutter/material.dart';

class MultiStepPassengerForm extends StatefulWidget {
  const MultiStepPassengerForm({super.key});

  @override
  State<MultiStepPassengerForm> createState() => _MultiStepPassengerFormState();
}

class _MultiStepPassengerFormState extends State<MultiStepPassengerForm> {
  final int _initialPage = 0;

  late PageController _pageViewController;
  // late TabController _tabController;

  String _passengerType = 'ADULT';
  int _totalPage = _passengerFormSteps.length;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageViewController = PageController(initialPage: _initialPage);
    // _tabController = TabController(length: _totalPage, vsync: this);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    // _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool prevEnabled = _currentPage > 0;
    final bool nextEnabled = _currentPage < (_totalPage - 1);

    // print('current page: $_currentPage');
    // print('total page: $_totalPage');
    // print('next enabled: $nextEnabled');

    return Stack(
      children: [
        Column(
          children: [
            _Header(
              currentStep: _passengerFormSteps[_currentPage],
              currentPage: _currentPage + 1,
              totalPage: _totalPage,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  // onPageChanged: _onPageViewChanged,
                  controller: _pageViewController,
                  children: [
                    PassengerType(
                      groupValue: _passengerType,
                      value: _passengerType,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _passengerType = value;
                          });
                        }
                      },
                    ),
                    const Center(child: PassengerPersonalData()),
                    Text('Dokumen Identitas'),
                    Text('Review'),
                  ],
                ),
              ),
            ),
          ],
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 16,
                children: [
                  TextButton(
                    onPressed: prevEnabled ? _prev : null,
                    child: Text('Previous'),
                  ),
                  ElevatedButton(
                    onPressed: nextEnabled ? _next : null,
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onPageChanged(int page) {
    _pageViewController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPage = page;
    });
  }

  void _next() async {
    _onPageChanged(_currentPage + 1);
  }

  void _prev() async {
    _onPageChanged(_currentPage - 1);
  }
}

class PassengerFormStep {
  const PassengerFormStep({required this.title, this.description});

  final String title;
  final String? description;
}

const List<PassengerFormStep> _passengerFormSteps = [
  PassengerFormStep(
    title: 'Tipe Penumpang',
    description: 'Next - Data Penumpang',
  ),
  PassengerFormStep(
    title: 'Data Penumpang',
    description: 'Next - Dokumen Identitas',
  ),
  PassengerFormStep(title: 'Dokument Identitas', description: 'Next - Review'),
  PassengerFormStep(title: 'Review'),
];

class _Header extends StatelessWidget {
  const _Header({
    required this.currentPage,
    required this.totalPage,
    required this.currentStep,
  });

  final int currentPage;
  final int totalPage;
  final PassengerFormStep currentStep;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey.shade50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 16,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentStep.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                if (currentStep.description != null)
                  Text(
                    currentStep.description!,
                    style: TextStyle(color: Colors.grey),
                  ),
              ],
            ),
            Stack(
              children: [
                SizedBox.square(
                  dimension: 64,
                  child: CircularProgressIndicator(
                    value: currentPage / totalPage,
                    color: Colors.blue,
                    backgroundColor: Colors.blue.shade100,
                  ),
                ),
                SizedBox.square(
                  dimension: 64,
                  child: Center(child: Text('$currentPage/$totalPage')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PassengerType extends StatelessWidget {
  const PassengerType({super.key, this.value, this.onChanged, this.groupValue});

  final String? groupValue;
  final String? value;
  final void Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text('Tipe Penumpang'),

            LabeledRadio(
              selected: value == 'ADULT',
              value: 'ADULT',
              groupValue: groupValue,
              onChanged: onChanged,
              label: Text('ADULT', style: TextStyle(letterSpacing: .25)),
            ),

            LabeledRadio(
              selected: value == 'INFANT',
              value: 'INFANT',
              groupValue: groupValue,
              onChanged: onChanged,
              label: Text('INFANT', style: TextStyle(letterSpacing: .25)),
            ),

            LabeledRadio(
              selected: value == 'CHILDREN',
              value: 'CHILDREN',
              groupValue: groupValue,
              onChanged: onChanged,
              label: Text('CHILDREN', style: TextStyle(letterSpacing: .25)),
            ),
          ],
        ),
      ),
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.selected,
  });

  final Widget label;
  final String value;
  final String? groupValue;
  final bool selected;
  final void Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(99)),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(99)),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        onTap: () {
          onChanged?.call(value);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            spacing: 8,
            children: [
              Radio<String>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
              label,
            ],
          ),
        ),
      ),
    );
  }
}

class PassengerPersonalData extends StatefulWidget {
  const PassengerPersonalData({super.key});

  @override
  State<PassengerPersonalData> createState() => _PassengerPersonalDataState();
}

class _PassengerPersonalDataState extends State<PassengerPersonalData> {
  final TextEditingController _firstnameController = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gelar
            // Nama depan
            const Text('Nama Depan'),
            const SizedBox(height: 4),
            TextFormField(
              controller: _firstnameController,
              validator: (value) {
                // if (value == null || value.isEmpty) {
                // return toLocale(DictKeys.validate_firstnameCannotBeEmpty);
                // }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(99)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(99)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorStyle: TextStyle(
                  decorationColor: Theme.of(context).colorScheme.error,
                  color: Theme.of(context).colorScheme.error,
                ),
                hintText: 'Nama Depan',
                suffixIcon: InkWell(
                  onTap: () {
                    _firstnameController.clear();
                  },
                  child: const Icon(Icons.close),
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Nama belakang
            const Text('Nama Belakang'),
            const SizedBox(height: 4),
            TextFormField(
              controller: _firstnameController,
              validator: (value) {
                // if (value == null || value.isEmpty) {
                // return toLocale(DictKeys.validate_firstnameCannotBeEmpty);
                // }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(99)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(99)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorStyle: TextStyle(
                  decorationColor: Theme.of(context).colorScheme.error,
                  color: Theme.of(context).colorScheme.error,
                ),
                hintText: 'Nama Belakang',
                suffixIcon: InkWell(
                  onTap: () {
                    _firstnameController.clear();
                  },
                  child: const Icon(Icons.close),
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Tanggal lahir
            // Kewarganegaraan
            // Nomor Telepon
          ],
        ),
      ),
    );
  }
}
