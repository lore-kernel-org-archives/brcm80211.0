Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4939267F77
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213474; cv=none; b=A5VkZIsHlfeYcS/bkhTliNOYxNbu0VB1ugM5No46mm3fhAwymI25j9vhbqaB9YzNDtnP2Gy6qdrAzz47dmKU594NA7M3Jg53ZZZuuRIoLmiXjr9bptTBS6JaQjBCAEIZQRUMhxx0Ypmp4+tzS+oXXUWKDAw/eEAqRKvWCXfe7EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213474; c=relaxed/simple;
	bh=Dh2iCy49AlSFY/9nHd6Unte6BCO4NJ7RSIG0FCrmwLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uZgDN0pLpcb8xCPOfuGKxnhFUe671bmi6zLjure6X3kJqioDoQ72YCwaYZWi1n5q/rZDz+c4TlPEGOH5nA4JRsxt0xVR8v9ykxZUZP3Og3+sLGwoJSs71PXVbZcuvW7SpJtV2vnXJafgghQ8aqCL+NCu0tuJd0yUVELjQUCCcbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDYzYbk0; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDYzYbk0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af9065f0fc0so4805973a12.2
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213471; x=1744818271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUUuTxOiF/e6pFbiGJ55Vd+VaZOP/yQaXFZJe/XlPzE=;
        b=ZDYzYbk0MjFP9h1DpofgUbOQLYPtnJCHrOWH0VMOJncyo50pSJpqw9uas6XgdKIUei
         xJOkwz4SHJj6aTZ/DtUvKPmELYLJ+KzEbHpjQbw3aiultd2sRyGzjjQ7n06l6Ph9HED6
         LmW9uyWpn8LsoUOBPI6+n+oFTZTddYym1xGiMGx+SkDuVb3uvMv7Km/Y2DC1qpVxWGSe
         gT0jJQuuto11VMj2MjT//osjSpS4wtEAyg5yUq4R/ZrJKp9zNSFXN3QWJYzB4LN2fJN0
         7t/7jRTUwooxNEcZ+/7b1vNmznApaTi341SQQ0pgR+d6fCc8dqdndmY9aCF5OvAky6Lv
         2+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213471; x=1744818271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUUuTxOiF/e6pFbiGJ55Vd+VaZOP/yQaXFZJe/XlPzE=;
        b=n8beUsC1B5//gUkP1Lx9CEUJQJtpEhR5YTKadRUhcOwh5Q5+P0fxLtWOayZx1AkEkn
         0ZKEQ4D7s+rrxgm+wgeYsuF1rZrfdUC8tH6xHYQd/RfBlsZH8zSRTIA2QU12f6EucvRU
         ipy7SzxlNGsjiKwjtV8FtGDKQGqogliOEAjjiCfFBHeisyDbtnbFBLs5vraRKUvxtWdL
         Ij8MbnIoiQ1l6H4+0/Y4m6am0Z2YjRvO/wwKsVdT+IC2Cq9wMq9VHHMH4sFxzlShruXx
         ZNuw3ps2zIcMdZAcr/4PtbSTg3uWxhyxUDbkN9fhbaReDtRABfHZsDq01CE8tcJ+PC3I
         K9gg==
X-Forwarded-Encrypted: i=1; AJvYcCUuMoBtxIXHVn1T1+2og0rMHFvJ9gH0mC8s3q2mR5rmASdEGXtKaWr8WYztGh9wkQmXzOltFclM1Nk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLmqLFelKKWz5E07ItM6SWs43aQ/jfkmhCulKLXjxDrjkROQ69
	Nr8pdW3mVIinUvapf+4IsAMxPvU1af5a2UHWm+Ih20XPQdh4gDh3
X-Gm-Gg: ASbGncvJ3/cgCQ5+Yp53rApsmYrJfZQMRVDWBzM8t+TX3LBtlq/MMI8OzMQRpLlg/I3
	9JEA8JwuDkg/nJ7S7svNVHafZWfTzATIv6IJ63Gl/Cs9rVx2nK0GRWTg1CzyTKlzdCjIW6RhAWo
	xQp26ZHtkkZK2wOHSRgpt85OuAKQnnA3mOW8SJausTxDCpJDdsZ3SjK4HIod2aC1YUE5zwJSm3H
	1G3tLl/d/bW5QH5qpX42Nnjn0I6OzovS/UR3p5rcxvJIfywLOzBA7ivdSuSSYuPldnXscG09JB0
	yku/m3CtvfnxdQ0oMoxYI9vXVom2KvuiTcIgaqguCe9fGvVdfGLrdRSIGClb31VIIYeNlNM=
X-Google-Smtp-Source: AGHT+IGnoEozOknyoC6We3L6wSu5LW5c8+l3K2S+PrKsnw7nWoi0Lt21fMnvhITP0Puz6RwfcrL34g==
X-Received: by 2002:a17:90a:d884:b0:2f9:cf97:56ac with SMTP id 98e67ed59e1d1-306dd1719cfmr5116718a91.0.1744213470998;
        Wed, 09 Apr 2025 08:44:30 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:44:30 -0700 (PDT)
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
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
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
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant parity code
Date: Wed,  9 Apr 2025 23:43:43 +0800
Message-Id: <20250409154356.423512-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several parts of the kernel contain open-coded and redundant
implementations of parity calculation. This patch series introduces
a unified helper, parity_odd(), to simplify and standardize these
cases.

The first patch renames parity8() to parity_odd(), changes its argument
type from u8 to u64 for broader applicability, and updates its return
type from int to bool to make its usage and return semantics more
intuitive-returning true for odd parity and false for even parity. It
also adds __attribute_const__ to enable compiler optimizations.

While more efficient implementations may exist, further optimization is
postponed until a use case in performance-critical paths arises.

Subsequent patches refactor various kernel components to replace
open-coded parity logic with the new helper, reducing code duplication
and improving consistency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---

To H. Peter:
I understand your preference for a parity8/16/32/64() style interface,
and I agree that such a design would better accommodate potential
arch-specific implementations. However, I suspect there are very few,
if any, users who care about the performance of parity calculations
enough to warrant such optimizations. So my inclination is to defer any
arch-specific or optimized implementations until we see parity_odd()
being used in hot paths.

Changes in v4:
- Rename parity8() to parity_odd().
- Change the argument type from u8 to u64.
- Use a single parity_odd() function.

Changes in v3:
- Avoid using __builtin_parity.
- Change return type to bool.
- Drop parity() macro.
- Change parityXX() << y to !!parityXX() << y.

Changes in v2:
- Provide fallback functions for __builtin_parity() when the compiler
  decides not to inline it
- Use __builtin_parity() when no architecture-specific implementation
  is available
- Optimize for constant folding when val is a compile-time constant
- Add a generic parity() macro
- Drop the x86 bootflag conversion patch since it has been merged into
  the tip tree

v3: https://lore.kernel.org/lkml/20250306162541.2633025-1-visitorckw@gmail.com/
v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/

Kuan-Wei Chiu (13):
  bitops: Change parity8() to parity_odd() with u64 input and bool
    return type
  media: media/test_drivers: Replace open-coded parity calculation with
    parity_odd()
  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
    parity_odd()
  media: saa7115: Replace open-coded parity calculation with
    parity_odd()
  serial: max3100: Replace open-coded parity calculation with
    parity_odd()
  lib/bch: Replace open-coded parity calculation with parity_odd()
  Input: joystick - Replace open-coded parity calculation with
    parity_odd()
  net: ethernet: oa_tc6: Replace open-coded parity calculation with
    parity_odd()
  wifi: brcm80211: Replace open-coded parity calculation with
    parity_odd()
  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
    parity_odd()
  mtd: ssfdc: Replace open-coded parity calculation with parity_odd()
  fsi: i2cr: Replace open-coded parity calculation with parity_odd()
  nfp: bpf: Replace open-coded parity calculation with parity_odd()

 arch/x86/kernel/bootflag.c                    |  4 +--
 drivers/fsi/fsi-master-i2cr.c                 | 20 +++------------
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 ++----
 drivers/hwmon/spd5118.c                       |  2 +-
 drivers/i3c/master/dw-i3c-master.c            |  2 +-
 drivers/i3c/master/i3c-master-cdns.c          |  2 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c      |  2 +-
 drivers/input/joystick/grip_mp.c              | 17 ++-----------
 drivers/input/joystick/sidewinder.c           | 25 ++++---------------
 drivers/media/i2c/saa7115.c                   | 12 ++-------
 drivers/media/pci/cx18/cx18-av-vbi.c          | 12 ++-------
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 ++----
 drivers/mtd/ssfdc.c                           | 20 +++------------
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +-----
 drivers/net/ethernet/oa_tc6.c                 | 19 +++-----------
 .../broadcom/brcm80211/brcmsmac/dma.c         | 18 ++-----------
 drivers/tty/serial/max3100.c                  |  3 ++-
 include/linux/bitops.h                        | 19 ++++++++------
 lib/bch.c                                     | 14 +----------
 19 files changed, 49 insertions(+), 165 deletions(-)

-- 
2.34.1

