Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80260213236
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278360; cv=none; b=Ip4wrJ3B0WJDu5Sg32RHkU3qyGqKprjDXbq6e19kfA+coMeO//0G1QPXBccnGuGeEIrm/qDMMC5BPX6WkC9Gjf0QZuNFGkjXIVj6S84W/gU3HLMDuD+18fze96OPmcI8RsC7qCjoBZGINW1rarcfPzCbIo9moE1fZzbw7LotpXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278360; c=relaxed/simple;
	bh=X1osDnOd9IPjfmzORkmuJvIJiGkdvCzDfoi5CFuWloE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MSB5fqwmhU0aaqB0d/KSbcpKRVUplO0iMpkP8/xFdLla/lCD4HSAbtYbSdmDqWtOXvHIPMYYNiNZfee82wuqEGh1dugUSqKClr78hErWhgC2XVhQ/sjauaGoTSpmoqFZNRvaIkwlSq+9IQgrjcW/2Y5T7WcoyRrAHrUdhDgjV+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNHk6EHh; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNHk6EHh"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff087762bbso1423205a91.3
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278358; x=1741883158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v1Sq6955SeW7fXdSe6bezpmzNTL9tmkfZyPLC9/YdtI=;
        b=iNHk6EHhX0CYkk2/49VyFmRoXE9Tq5c+jmd8XEjamsdItW/BHk0xEdFfkjzTkwH3DJ
         lBAdZh03Poc3XJsa5X95UuvvqmMJwQ6LYL6ScMIlBgou48rNz9TWtsxsgi2NF3Pshzi/
         snRuclmGVP0NHLMeT2PSDBZYCaSfZVFY9THzzX3mZACKDVBcoyh5v/C1CwfnMUK3cIeh
         B9Z1CF8xsNGC43aFm/lQ/Ocr6to1BrMoWAnFCPqNPQBrb16yr8AWxscTNCQ+yoB5cM8A
         Hb+Yg6dsaIcQ/sdumnXETnNr0M1KC3xz/uADrtNI0LdVKbajO5L+qx1WshElMSIWjFu/
         32+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278358; x=1741883158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1Sq6955SeW7fXdSe6bezpmzNTL9tmkfZyPLC9/YdtI=;
        b=pz/75ytvMdR1ooQA4LgYjCcztEyiyXBJuvIj0OpbLW7rD+aksKwjrceSSvO0CBve2K
         DyDSqih7Cc4eMhz9gAewnZH/stRAoaq7QDI0IHEg61EmUHQl/zl69vMCp3e8/OLbMhw2
         imv1cp7QGMKwVkqStvR+6fhOyP2bWtErWM3qvtRM2Dpt7qhmVkSciLctv2fpc1lmXHzV
         jbUfpjUM9XRNTGcZ5MQPAQDGr1I4jtqmVEiG/4IbGs/0ETJb5b8xVF04ChAHo/dmLwft
         ts0b0sMLB/rOqvmCGBwIIn111vQ/6ySb9zLKMBEjLKrQVxupkQcWv3Y5CjH154tdkpQU
         ABHw==
X-Forwarded-Encrypted: i=1; AJvYcCWmCMId/dTwqcHulX9K945Vq5CvPSqeaMAaLzqFz/wEUDOcheCu/cq34XoVEpnzhUX8K1YDVG/seiE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9Tx+WyFV48MHFzxbvPyp8R/eV37pnMhORA4beU23mJGUgTP5i
	9RV+sJCdGB9TGX+DqBJMjAISO7V43l/5QT8fUrI5WByp5LooSl8x
X-Gm-Gg: ASbGnct5QoR351uhjdo32ICKcDlAXy3z39RRM/XTKdaGDBk4CHwS37+osJlBOCx5sE4
	PoQedQ0Es+j5niWd4lcxRTyQagzrux074hqXCYPeTvimtGyJT/LwNna3v4pmzrt7r0jcOUSBhXZ
	lZmu3t2hTrVQW1T8Rz7jE07ZBexjy/qrYfpoTdKiVU4/BqwReaqJQ/9H/hIchu8X+SQQX4fzlSK
	fuoWtbNbE1XaKFftaTkzMf+wDF2p/7iXqKlQRErwX5W2Aq4kL60M4BHboinMVcDuafet93YFIOb
	seXTwxP1RNKxFOC1Oq90F5ALhOoQ0/A/or7AuF+2cfLZ7NMfCQYCDkidFeqClQyFEszpJ1nJUFM
	=
X-Google-Smtp-Source: AGHT+IHx/FA9q9VeYWlT31tM+odxs15FTKCjv2n+9fQOLwshtfFtm1FM7EynPDhqEgIZlabXqJLing==
X-Received: by 2002:a17:90b:2702:b0:2fe:99cf:f566 with SMTP id 98e67ed59e1d1-2ff49775b54mr11884816a91.13.1741278357585;
        Thu, 06 Mar 2025 08:25:57 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:25:56 -0800 (PST)
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Date: Fri,  7 Mar 2025 00:25:25 +0800
Message-Id: <20250306162541.2633025-1-visitorckw@gmail.com>
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
In v3, I use parityXX() instead of the parity() macro since the
parity() macro may generate suboptimal code and requires special hacks
to make GCC happy. If anyone still prefers a single parity() macro,
please let me know.

Additionally, I changed parityXX() << y users to !!parityXX() << y
because, unlike C++, C does not guarantee that true casts to int as 1.

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

v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/

Kuan-Wei Chiu (16):
  bitops: Change parity8() return type to bool
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

 drivers/fsi/fsi-master-i2cr.c                 | 18 ++-----
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 +--
 drivers/input/joystick/grip_mp.c              | 17 +-----
 drivers/input/joystick/sidewinder.c           | 24 ++-------
 drivers/media/i2c/saa7115.c                   | 12 +----
 drivers/media/pci/cx18/cx18-av-vbi.c          | 12 +----
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 +--
 drivers/mtd/ssfdc.c                           | 20 ++-----
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +--
 drivers/net/ethernet/oa_tc6.c                 | 19 ++-----
 .../broadcom/brcm80211/brcmsmac/dma.c         | 16 +-----
 drivers/tty/serial/max3100.c                  |  3 +-
 include/linux/bitops.h                        | 52 +++++++++++++++++--
 lib/bch.c                                     | 14 +----
 14 files changed, 77 insertions(+), 153 deletions(-)

-- 
2.34.1

