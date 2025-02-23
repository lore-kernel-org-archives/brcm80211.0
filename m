Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01ADA95C
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740328970; cv=none; b=XFAq7gkQailfa+uUWAWUEe9po2JCppu+dNVmiZFOAgzMHdLgKxe+yZ2VJrgGMa5t7iui49dj69iWaOpKc5z+b2mAPy7ySB4iC/SaWJTdF3Lv0c2Bk2KMMzYu/v3JVm7+EbdLBvy4q6I/B85N+U5a2eb9RNwULmdgQlUsgLlLFXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740328970; c=relaxed/simple;
	bh=8XZ+LCP+IJ1T0NsJnmk05Bo9WbAvIux7frjHXYDMeLk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GlF6zS9tRay79s6ofn93fFBm5UKOoWuRKowq8Ais8/9vE/4e0fk3yx/UTd5nDX1pns0rtQSurd98bP/4N0G1tlJd9+VHtuAJ3aFj4iOBXjjsXfjt/NexAj4IycmUsIxaFgTjnE/s86lzo10J+8IqtxjWVEmLdEVb1gSHlsLuIw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adAokbCJ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adAokbCJ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fa48404207so7514058a91.1
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740328968; x=1740933768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cC9XqKWpwoW6kaiQnMTAJRMWrDuUOdRDnNZLQfAjkgk=;
        b=adAokbCJwQF8mSB3N3UUtp2Cw0jt1BWeEJDKApYD8a/7u+ydYcLI2dbIHEonShLWkI
         VG9wzdfHnEGSUR60kcuOe0jrgLGj2FkA7spwwkpMwGToqioiH/rAwsXOiznI5afNFxNs
         4d3uKewPD+G4pg0Xx+l+jEoQD4SfrODm+6gXKNRvnaObdMBVeKPRS0f732kRZc2I2Dqz
         7rvz6I3/ytMxKU4d17YjxXMO6nEYGngpQjx4lxB+9wHNdr1lu0i63xrErIeWlSfzVjin
         34O9oa/obRYU9vxR5a7XF3zsC1WicbuBNp4Qfxi6az6AMs6SXgWHj5oHLyzUHc5CrAS6
         FZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740328968; x=1740933768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cC9XqKWpwoW6kaiQnMTAJRMWrDuUOdRDnNZLQfAjkgk=;
        b=w07r5RK3CIJx3s003oaZu5AO8D7LY8JP7K/rWqKTo4kjBanfEFf33sZnqfM4/VOoKp
         Th1cYQvQ95mDtsfOzgfrY5E3NHkIar9TYsOhmNy/EdNKKzkhIbW3scdXlsSlg7OITg6F
         NfPZIl0O+cgjE5EOdUVujN2kZca6WmZe2JbOpTh3VbIo0iQwP9nl902axkadmgXYKd/N
         Qt2tFEOqi0kn1v7KbwTdGQexBV2kJbVxLXH4LT7FuP6vBNYlb3HgA2006ghZfx8TlXfU
         XMFf6XYRRgcrDtXUbP9sw6UyaNJTT6i5d51tiqDoNmQe/1cSxlVyOcyrwOwYpknWbOkF
         d2xA==
X-Forwarded-Encrypted: i=1; AJvYcCWy5stkvmqMhJXUsP1W57HcVPsX3E8Mxm6K8ZAxBGxal5bgfEApg/WaUH9lyiYi4Cqcc2xuAvNqc+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4sRPwu6WtkLaCNitq4wUyrJHRm3wXIFAksMtMN4rTmpV1tgkD
	qupKMhW8r3s5KJuea7xlrQ4xF1sIlCeA2kY1bi5cUc60QqmvFHVO
X-Gm-Gg: ASbGncsbjMfHgCMdm5BhGHrX/6mve2xspq4pbX9oAesHyx+rbhh7KexXomsseP0cKMv
	tN9+M4NDfrz4kOHyyjmi2PXaYYMxfIFrstrQy1QvHsmrbbKqpu3oqeZHi0xVaLhHdRf1qch9oLH
	Woue4Q3scRMWlM1BiT1YqywbDoxoH8LEToBhIhLkvIoWJUdhpoTXAGM7Iym1H4rgXRf/I/8ED76
	ERnW+HAqwKVJzHWUDxGV6qc8d/ZjgPPua0AjGqxGvNzRdM7Q1rzhjv/lCn0tVJOtUWLCt7XE8fz
	czVWc0WfXFpuGyozWW+ZI6QssuHIsKLLSZDFTTKktDk9N2AkWRaODqxR
X-Google-Smtp-Source: AGHT+IE9IoeqkqZm6OQjrr5kPJ0U3iRTenWYdpH7xXhEtXcp87aYt41gR2kUOpfxylsV56aTy8WbdA==
X-Received: by 2002:a17:90b:2e44:b0:2f5:63a:44f9 with SMTP id 98e67ed59e1d1-2fce7b0acaamr15072669a91.23.1740328967814;
        Sun, 23 Feb 2025 08:42:47 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:42:47 -0800 (PST)
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
Subject: [PATCH 00/17] Introduce and use generic parity32/64 helper
Date: Mon, 24 Feb 2025 00:42:00 +0800
Message-Id: <20250223164217.2139331-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several parts of the kernel contain redundant implementations of parity
calculations for 32-bit and 64-bit values. Introduces generic
parity32() and parity64() helpers in bitops.h, providing a standardized
and optimized implementation.  

Subsequent patches refactor various kernel components to replace
open-coded parity calculations with the new helpers, reducing code
duplication and improving maintainability.  

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Kuan-Wei Chiu (17):
  bitops: Add generic parity calculation for u32
  bitops: Add generic parity calculation for u64
  x86: Replace open-coded parity calculation with parity8()
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
  rm/bridge: dw-hdmi: Replace open-coded parity calculation with
    parity32()
  mtd: ssfdc: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity64()
  Input: joystick - Replace open-coded parity calculation with
    parity64()
  nfp: bpf: Replace open-coded parity calculation with parity64()

 arch/x86/kernel/bootflag.c                    | 18 ++------
 drivers/fsi/fsi-master-i2cr.c                 | 18 ++------
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 +---
 drivers/input/joystick/grip_mp.c              | 17 +-------
 drivers/input/joystick/sidewinder.c           | 24 +++--------
 drivers/media/i2c/saa7115.c                   | 12 +-----
 drivers/media/pci/cx18/cx18-av-vbi.c          | 12 +-----
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 +---
 drivers/mtd/ssfdc.c                           | 17 +-------
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +--
 drivers/net/ethernet/oa_tc6.c                 | 19 ++------
 .../broadcom/brcm80211/brcmsmac/dma.c         | 16 +------
 drivers/tty/serial/max3100.c                  |  3 +-
 include/linux/bitops.h                        | 43 +++++++++++++++++++
 lib/bch.c                                     | 14 +-----
 15 files changed, 74 insertions(+), 162 deletions(-)

-- 
2.34.1

