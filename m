Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D31E04BD
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839117; cv=none; b=dlCNci+tTW1YO7uWczZZPr41uX3ffrGdSukvMbVgmUozHkbplL7iPhRmsooOi2uIm0pibPjYVuHvl5SAxTSjUDRU5UTOkkfVbTw5wN1nRfWAuzzhxLGjOZCDoxQJEMPzUDYXL6fyJUwWaocQngbLkubpcxY2zx9YTwC9Ds6j1cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839117; c=relaxed/simple;
	bh=cIgJmn96AbC/m2stobLaS3QgXAnH7idqnvJn+4l7pgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ocXxjKUPNZHYxDb8C6vxQNaT+W2BQnHlJjgtomRM74F0nwtAKA8iMJISAPxI3TOInouHWCKFT1lRTuC3cGI2ScnyJ2r16d82IZzJ9uB3xzFlnilosdxUAYFNNjl+cnc3VRyiAotYX5v5ZINItaR/VZLP1RznfhfpXO1EtNO57Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5ZRe1F3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5ZRe1F3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2234e5347e2so62551515ad.1
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839115; x=1741443915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNP1gcd9iHRxzh69rYhVl4jkjT7XmE00fWzfP312xis=;
        b=h5ZRe1F3pLUECMbnV4jn6bOgrotU5byeCiMfyciNPTIjmV+gOwrHcpukdyP+lvaBBn
         QWPgT7Kbhcgy1dM31JEceUsjHNqH5Gr/zMbgG/PJP0gIqjKaCZjuDKAY0ptjchMIrERI
         OSWpPJz5+2GH3DLDbkZO4+/8Cz4b9jJKClTeRQyv4qfSz6vhUgMfRnde7bkrffhmzYJh
         XoyGMmqAoJOQn/NqOmabzjH5lgJ9rBd1dpibZnrUXYRqgPoW7gdqtHtAYABzfbKz+x3O
         IoeRXMGy1xI4Kc5VoSj+lx4bJSSyIJ7zgJXC5JB2nCaVW6dC044dZ7B3X43XtTibl/OT
         rluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839115; x=1741443915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNP1gcd9iHRxzh69rYhVl4jkjT7XmE00fWzfP312xis=;
        b=jx+jqnfpHAEhxhdPvTKU7yZQ1cARTu2IIWaZNbAJbE+3Dvn9d2jApw1mTk5fzzMDyk
         6oBV9WDF2LStHE5gul/0jD98x3EK5IAYrgTDX+y/JRFNOS99LzlUxdE0NVOeMNXEAuMO
         yj6v3u+yx0AeY+TkPIopXkbZ57Ky0oKsS7icuz+EADS8xUPcxgL+O3bX0jJ115dMaXB9
         OknqXyQoxIWGXxDHJSFjbi+gUrszTOY9aRU50wMc5yotCEdXp5nfLGpOTlYWj+gCIqFf
         ueOcVFzb2CKTrzCPvdkHF00YFR8yae8KQi+sIQynySyGCpdbtMTzsSVxyKZFODlO+6y9
         s6hg==
X-Forwarded-Encrypted: i=1; AJvYcCXiSL7ghPJWPOVgZX6JQVzTi8Sd2TNaF5SP+L/GOraHnY/NqmdwsaVeToIh3NWWvqn5xLXZ9pA1yO0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0CF6Wyjhz/cC9CCo+WaoeKYxCuZrS8+on96eAgUybTz4dn07J
	4/843JuksgwMho6KY00y0aJvRF80EjCG5vBoNca9TYUkc3d7S7VC
X-Gm-Gg: ASbGncsOAyGLY1iNBv28aBBjsJokwo/yG2HYgHlTv/TAEbkeIJrF9Kl9qtDLw43ue2a
	vhO3zoUsxPCJ/h/vScbLqXML8tbRHxgZVtyB8ULAL2hfUgiowtlEz0fzY5a1jnegcYNg9vJV2sE
	qQ9v5LR0XU8n3HLZGr+rlPejUQQ2OrCvRZy2GY6ine4tBS2f0SJxqCUwpV3d3sgG7zwZ74+5BhW
	QnuLaGY5GJHFqjlEYlCEVHkSiQFc3KfE+qZdIcX54W/sGrVgmx4sMpl5UiqPo7bdfIyYx7Nt3+s
	yA4QaRTGlfR6cbwjDvgzkzMFBBl5z8zlWYvNDtAbNL8K6l6HItw+g4PGm+MD6jGte6mejBRVzbg
	=
X-Google-Smtp-Source: AGHT+IFmQ7+Wt4EJx82M81pMqmqG6vjS1UaCqAsjmQIBhBcvOofXBIwpdWFf7GWkoh7LWsBn9NTlfg==
X-Received: by 2002:a17:902:c948:b0:220:d79f:60f1 with SMTP id d9443c01a7336-2236920765bmr101611195ad.42.1740839114994;
        Sat, 01 Mar 2025 06:25:14 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:25:14 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 00/18] Introduce and use generic parity16/32/64 helper
Date: Sat,  1 Mar 2025 22:23:51 +0800
Message-Id: <20250301142409.2513835-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several parts of the kernel contain redundant implementations of parity
calculations for 16/32/64-bit values. Introduces generic
parity16/32/64() helpers in bitops.h, providing a standardized
and optimized implementation.  

Subsequent patches refactor various kernel components to replace
open-coded parity calculations with the new helpers, reducing code
duplication and improving maintainability.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---

This patch series is based on next-20250228.

Changes in v2:
- Provide fallback functions for __builtin_parity() when the compiler
  decides not to inline it
- Use __builtin_parity() when no architecture-specific implementation
  is available
- Optimize for constant folding when val is a compile-time constant
- Add a generic parity() macro
- Drop the x86 bootflag conversion patch since it has been merged into
  the tip tree

Kuan-Wei Chiu (18):
  lib/parity: Add __builtin_parity() fallback implementations
  bitops: Optimize parity8() using __builtin_parity()
  bitops: Add parity16(), parity32(), and parity64() helpers
  media: media/test_drivers: Replace open-coded parity calculation with
    parity8()
  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
    parity8()
  media: saa7115: Replace open-coded parity calculation with parity8()
  serial: max3100: Replace open-coded parity calculation with parity8()
  lib/bch: Replace open-coded parity calculation with parity32()
  Input: joystick - Replace open-coded parity calculation with
    parity32()
  net: ethernet: oa_tc6: Replace open-coded parity calculation with
    parity32()
  wifi: brcm80211: Replace open-coded parity calculation with parity32()
  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
    parity32()
  mtd: ssfdc: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity64()
  Input: joystick - Replace open-coded parity calculation with
    parity64()
  nfp: bpf: Replace open-coded parity calculation with parity64()
  bitops: Add parity() macro for automatic type-based selection

 drivers/fsi/fsi-master-i2cr.c                 |  18 +--
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |   8 +-
 drivers/input/joystick/grip_mp.c              |  17 +--
 drivers/input/joystick/sidewinder.c           |  24 +---
 drivers/media/i2c/saa7115.c                   |  12 +-
 drivers/media/pci/cx18/cx18-av-vbi.c          |  12 +-
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |   8 +-
 drivers/mtd/ssfdc.c                           |  17 +--
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |   7 +-
 drivers/net/ethernet/oa_tc6.c                 |  19 +--
 .../broadcom/brcm80211/brcmsmac/dma.c         |  16 +--
 drivers/tty/serial/max3100.c                  |   3 +-
 include/linux/bitops.h                        | 115 ++++++++++++++++--
 lib/Makefile                                  |   2 +-
 lib/bch.c                                     |  14 +--
 lib/parity.c                                  |  48 ++++++++
 16 files changed, 185 insertions(+), 155 deletions(-)
 create mode 100644 lib/parity.c

-- 
2.34.1

