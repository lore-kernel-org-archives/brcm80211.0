Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916049;
	b=phoNy/e9MiDY1SW7mVK21LDKq5vlghn53F41vByWLkIaiqitQQ5YD4mWeWFR+QMw85lu
	 b/iXaWPT/eomKd25Zy6GDo6ligxA1ioEN3247d2mqFFp9ujGGDz7BYr884YQvk1ffIGoF
	 F9XZKkkqvzx5dv7YlGfW93FStuGDzvrhh8/KbEjiyL7lEXCO+klaGKUf6kc1LxNxCihbl
	 nNVnyXOfNpa7j5R/0UULJx66var2kHVLrpE5cukITvlrvatxm8alcBNAws3xFpFV23Wa4
	 Q+5D1cT2oUb+0NuESOmTcL8Cs3xcy4M3IRa0AMp7XmvN/htn+Un56+X3EeqBaIn4iqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wqunNf7po3SWQvrl/Fx8/EGqJsJQtjAHPOjZVlD31M4=;
	b=iAAhyzUQR/Plf73fVuLg0V06UZQqi/uCVrozxGhRe93fMMQt0W/ho4OcDAOm1T4qoYPJ
	 u04jNXtEEjg8PdzwQ2P8hHiHZIChq8/OZqXZFZ41pSFPeL+cItHBYc3Pm0lB4wrc+bT39
	 C5dNFloIRTxzEq5huMOUXkS+rwDfvCs9py+tBt+0kllhzUK9rGUEdmCgCTjbqB8yAkTS9
	 lqjL5stGeLC/q4VM0ovCjo/jM2vyX15hQECpGwg9cxd3txWAFerX4bsKBBwJ2t1yoNksf
	 YzPRzI9L8hixziSQOimr2gmxkrZi4vov07g/AH2Lo/FuZj+JcB68Z3aOvVvcAhky5Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EHlOGQk4;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC951606A31B
	for <brcm80211@lists.linux.dev>; Thu,  5 Nov 2026 22:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC951606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EHlOGQk4
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so134055e9.1
        for <brcm80211@lists.linux.dev>; Thu, 05 Nov 2026 14:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793916047; x=1794520847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wqunNf7po3SWQvrl/Fx8/EGqJsJQtjAHPOjZVlD31M4=;
        b=EHlOGQk4vqqM9R5BW/K+6fyP7RyLcZ8PtRM5ocx/aqOYrtV/K2DlbVqBtjpvIbEziF
         B2fRy/L0kyjnDl0pKvNS2KV1miCYpXYgaUUljRA8zXT22mznevlUtkpjmDqCZle6nCET
         wJeGZs8AjkJdT6DLYSiOId7btSEO9r3+z7l+zGqnuP6ZmwcfIqWRCQfkRH04lEPFYshY
         VY3C3wE6kRl5awBlWtPzw1JGp7jMORvb/YJ7JXfLn0inyIuq2SFxcP16I+waomvI9N+A
         sD3OGjtJ71CTq7DBleJPdFYPhQJSd2Qfoua34UwskDMw9gqexi/igYrGMdqSwotv1vQ1
         Tkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793916047; x=1794520847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqunNf7po3SWQvrl/Fx8/EGqJsJQtjAHPOjZVlD31M4=;
        b=r9+2BJfL30m6XFr5MLv6dndWfzGuY0h7/oh54wERxYCDDx1BoOKVsQbErWFpmbW9Ri
         Vy9o/5qKFUhQgT6QdoAPwNfQ5z31l9BwlKME0oav5gJIk8zxjB+jKV8hghG3P3vf7r/3
         FexnniLiPuN6iSCDrTw9hyjHQy+xZUfVqY4kVlBz+jpGMsnaD2xWLy0stpV0vu0w0duK
         vbomqoAK9B3KY6zOD3o/0bDX7aobe3lhdxTXHUCgcePnExCnHI8KvGP8LGo4LmIY1H6/
         FSlZEfKp8bHx2TXCiY0yZaG3w2yIlFO/BqWqxNok9lkPoMVgPUAreiz2+yBUFcBWDcMr
         DsZA==
X-Forwarded-Encrypted: i=1; AKwUvBzL3ApuQyWBDSRIXieUUukaYDS6SLl7zkHIndgmsKWFD1RwWZljj8F7EP8CaxAygWZYxsrQ9sYbcNI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8GoAAWxywPZbAqf1ckzPcmDkQCpTQALxRT55eiOgyYqG/9knf2
	E6ebzV9aQwrCiV1lgjQ2BhSgQSAsWdRYYxJmcISDMHY/FPtXz6c2JChmCul7RM7IUQs=
X-Gm-Gg: AYBFou2pDicY/KLeZKFPr4cmPeCx09sCfrICYsVXdT/nLbU2PZfdsee6nzRgom2KgWI
	cDlZp+FBUNyDhy+1H+xR7uSw5mMLN/XlcGRoqGW4UZJsztU5EPVgEc8GMpVdUCpTE2jq0WNwoSt
	TpIvOhmbFwYQ/lnfmPbUcfWHPTQEToqrAdjfQyICtFm864KcLFVSdr1T6R8dxREGJOu2eMCp+Lk
	IFRsIOcntSI2E80zSaD/u5rE4SB+AIUbo8O3twloKSSRstXjINZJm12tlz5bHRFrsKmh9pDP8OE
	V4DSkMovTO5iGNecLSPk4Npco1Xu9EiskY/BTQDSp5SHT/8NP6o6nGTnAKQBo7VM27Y14FkQj6u
	nc3cvE7yxWXcVIjwTOEOiTWd0JB75UUt4tgdEtF6H5wDCXtL6q/IkewodD3gs6HbK3x3MjiA8w+
	w/jZ98mVbwvNgljTsmz/mEh9uUWoReEQorU+tVmn5QxfXg0KZWaNMK+t3/bAajQqS+lDrjrg1Dk
	6bRE39ahaBSS1o/qXZrqvfH66aix0ppJZIr8htlvhBBNA83e3gFIRwX+AdQyWDlNDVCYmNRIc1e
	lxwJzMfS89TVI4m50a1Rzs7Qx7XCt81A4bgFnv48fb/TRhPjkVuawE+ZZrnvZJJUcXCxxY7GM5n
	MXtrhdjMc
X-Received: by 2002:a05:600c:c16a:b0:4a2:150f:160f with SMTP id 5b1f17b1804b1-4b6dfe8d0bdmr6835185e9.25.1793916046944;
        Thu, 05 Nov 2026 14:00:46 -0800 (PST)
Received: from soeren-MS-7A32.tail37253f.ts.net ([2001:a61:13ae:e301:329c:23ff:fea4:379])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm11922212f8f.48.2026.11.05.14.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:00:46 -0800 (PST)
From: Soeren Coremans <sorencoremans@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Soeren Coremans <sorencoremans@gmail.com>
Subject: [PATCH wireless-next 0/3] wifi: brcmfmac: pcie: recover from fatal PCIe errors
Date: Thu,  5 Nov 2026 22:59:51 +0100
Message-ID: <20261105215954.184290-1-sorencoremans@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a desktop board with a BCM4366/4 (14e4:43c3, firmware 10.28.2), the
firmware traps every few days, at the same address in every trap I
checked. The driver's reset recovered from 10 of 12 traps in five
weeks. In the other two, the downstream port reported a fatal FCP error
about 0.7 s after the trap:

  pcieport 0000:16:01.0: PCIe Bus Error: severity=Uncorrectable (Fatal)
  pcieport 0000:16:01.0:    [13] FCP                    (First)
  brcmfmac 0000:18:00.0: AER: can't recover (no error_detected callback)
  brcmfmac: brcmf_chip_get_raminfo: RAM size is incorrect
  brcmfmac 0000:18:00.0: brcmf_pcie_setup: Dongle setup failed

WiFi then stayed dead until reboot, and brcmf_pcie_bus_console_read()
kept logging 0xff characters at about 2,800 lines per second.

Patch 1 stops that console loop. Patch 2 fixes a fault in the memdump
that patch 1 uncovers on CONFIG_BRCMDBG builds. Patch 3 adds PCI error
handlers and re-probes the device after the link reset.

Patches 1 and 2 are fixes and could go through wireless instead. Patch 3
depends on patch 1: without it, error_detected() waits forever for a
reset that is stuck in the console loop. I sent them together against
wireless-next for that reason, and am happy to split them if you prefer.

Testing
-------

All runs used a test kernel built from the Ubuntu 7.0.0-42 source (based
on v7.0.14), with CONFIG_PCIEAER_INJECT and, unless noted, CONFIG_BRCMDBG.
On the stock Ubuntu kernel the series has only run for about an hour,
which did not exercise the error paths. Results on the test kernel:

- aer_inject with FCP on the downstream port 0000:16:01.0, alone (5
  runs) and 0.3 s after a debugfs-triggered bus reset, which mimics the
  trap-then-FCP order seen in the field (10 runs), plus one plain reset:
  WiFi back within 6-12 s in 16 of 16 runs.
- The final series, built without CONFIG_BRCMDBG: 5 of 5 injected-only
  runs recovered in 6-12 s. The combined reset-and-inject case needs the
  debugfs reset file, so it only ran on the debug build, shortly before
  two small cleanups (no markers, kzalloc_obj()).
- Real FCP errors, no injection (aer_inject unloaded): debugfs-triggered
  resets under a ping flood over WiFi produced 3 real fatal errors in 47
  resets. All 3 recovered: "device recovery successful", one re-probe, and
  WiFi back within 4-11 s of the error. The log order matches the field
  failures, including the "delete_flowring: timed out" about 60 ms before
  the error. These runs used the debug build.
- Without the series, the injected error reproduces the dead device and
  the log flood.

Not done:

- No runtime test on wireless-next. I only compiled pcie.c from
  wireless-next with the series applied (W=1, no new warnings), against
  7.0 headers; the rest of the driver does not build against those.
- The real errors above came from resets on healthy firmware. I have only
  run the series for about a day, so a firmware trap followed by an FCP
  error is still unverified.

Open points
-----------

1. Patch 3 re-probes because brcmf_pcie_reset() alone was not enough
   after a link reset: in 5 of 9 runs the firmware came up, but scan
   results showed the guest network's SSID under the main network's
   BSSID, and association failed with status 16. I did not find which
   part of the probe-time setup is missing.

2. The FCP error may come from the driver's own chip reset. It arrived
   0.6-0.7 s after teardown started in every real case, about when
   brcmf_pcie_reset_device() writes the watchdog register. That is timing
   only, I have no proof of the cause. Frequency: 2 of 12 firmware traps,
   3 of 47 debugfs resets, 2 of 20 module unloads. An error during unload
   leaves the device dead, as no driver is bound to recover it; this series
   does not address that.

3. brcmf_pcie_reset() and brcmf_pcie_remove() free the DMA rings before
   brcmf_pcie_reset_device() stops the chip. In one of those unloads, the
   device wrote into freed buffers first (8 AMD-Vi IO_PAGE_FAULTs). The
   other real errors showed no such faults, so this looks separate. This
   series does not touch the order; you may know whether it is deliberate.

Tool use
--------

I developed this series with an AI coding assistant, Claude Opus 5.5
(Anthropic), in one long session. I asked it why my WiFi kept
disappearing. It read the logs and the driver source, proposed the
analysis and the fixes, wrote the code, commit messages and test
scripts, and set up the aer_inject test kernel. I ran every test on my
hardware, chose between the options it offered (for example re-probing
after the internal reset failed the tests), and reviewed the patches
before sending.

Soeren Coremans (3):
  wifi: brcmfmac: pcie: stop console read on invalid write index
  wifi: brcmfmac: pcie: bound memdump to the mapped TCM window
  wifi: brcmfmac: pcie: recover from fatal PCIe errors

 .../broadcom/brcm80211/brcmfmac/pcie.c        | 144 +++++++++++++++++-
 1 file changed, 143 insertions(+), 1 deletion(-)


base-commit: b8e5b0ae8ff47240366d38e5d12c65f878724316
-- 
2.53.0

