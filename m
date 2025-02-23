Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381DA42AAF
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329005; cv=none; b=fQVT+x/joyiGgZlZ15MEW50jLLG5U+URBSFifq0cuIvuWWdBDdJw5ycrkP9bN+PmOPReQNApEwQ7wmXzb0mz0goBeG7hObeS7czPv7yW24H/9YLRIwJIdI44cnuGr5QNYUMIOOI/Was33crGuCl6xoBLNxW9PCy1+6OCHhAGL3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329005; c=relaxed/simple;
	bh=gsZPsEY5OYQwjaN0ui4KqvGSNWWg5CZ6i/qi0o892U4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YQnK4oGMA8U9BT7Fhl5iLfU8lHl7XNrIX+4nz0iTPFmB/2F1XTGF/YdR8XYkmch4IbbS3CO+4XVsYX2XV9zclX8JOkbj1QX+a/AO6aA2HuE6tm53G06234j+tvOi/JaMSBlBH0TpwUa1jvKvFB56JybMaBmxqhet481VQd6fr5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCHbsdDQ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCHbsdDQ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fc042c9290so5702223a91.0
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329003; x=1740933803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmrxQyU7jDRE4tATauCMPx/rjxqRJrbj6hI/X9rAOQs=;
        b=LCHbsdDQMVtg/UsVTGpwAc65T6yuAD47wzrKaujvbknaHJ9lSAiLb3MaspQCg4bvXy
         Z1VXj2AN6fe9D1Gg+Xy90E5lmVwvJfmGOLCo0ssnYp6aR365G3p+ZoLvj8PnZBgJulTY
         UWKRvThytm1d3bdWn9vDayefkFMr9qvcIDHZv5L7TXVqd79NYjLHMG3wQD05KQlvjuv6
         cm8wReKPyIn36uJ65SAhuEoDWeJusmLTCZ2nNEQ7fVEBTP+hkHvPO+R/4hfTZwuvaDAP
         aj6bO06gbMd2/BRooOJUttECd06EEbehl/D+2LDKvuJBORRoiEoYUV9Ay3hZXpjKY5qM
         +jtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329003; x=1740933803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmrxQyU7jDRE4tATauCMPx/rjxqRJrbj6hI/X9rAOQs=;
        b=fYkg3EF+fzTCV9mhbL2LPqNU7AMkpM0CzemTzfu/C8fgRWbTyfF714B0CabHtNwKPe
         BtjJLer05IvZeWh0d5HyLp9/iSFJZrPgvAeRVF/q2x5pIsxtbksgK4FhXmzz/8HTKeSl
         snEKb3TjHz/SCL97wfhstGjIx7OdBDvuyLwEadspw+1UURmVR1gRg7IPpsuGkAEBZ7i2
         eK9LiM1cbw/gFVNApcEMeDcg+ItGrpvhXO8pczbBMhYx2lnW7M8Ac+MP1i0PP17r5cK9
         qvS+fIPy6Lgbfyf9XJtFnNOvDywoQaTfvgwcluR1G5wrPM3HOdh3NidyZ3IPJpQfJclI
         gS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWh6vgdPZlKWSNhx7pALcJyke4NBVRgF6Gdq1Z1+LWB9zD/AlmVAiT8vN8Q20YsOQ/xXnXmuohUlAc=@lists.linux.dev
X-Gm-Message-State: AOJu0YytqZnLTYvnrBjx2veS1hJSIUdDB4usokWOGS6gY1GfCAjFrnWt
	8rQYeFETx2edArrjIzwYFRuBJn0ycWmU++sCBBM71QS1MQYzLmin
X-Gm-Gg: ASbGncvAib9yOcnmpozTuXV5PrcVP3w73fU63ByBtbaKLupFLn+h5E6oNz1Hn4al4rG
	nOrLdnwLssMaHNJlz5V6efNUL/7sAdntOXvV+S16Bu6PtMFnYIi/y3hHi18mZRlsjc2NCEbrXsb
	vmWZEKivMEZ5T9phODtfOjIG4ZsneSn0pzjYbgoO37u1vqTh+cyMJcsoMZ84m00f3WFQOsasfKR
	v0k3DyPWjNmA6kX40yhFxEBMUgP1xjzXaQIeTtkfOMyoIMdeUhxpKACFceX742misWbwRrgEBPT
	sfOpX+4Vj8Ud2jRzCFPmglRFpGLwTHCedYyz7fJICjoNv2St6rJKUSnb
X-Google-Smtp-Source: AGHT+IFT1Vzkj4StFehOYZfGx3Pqek+1r8/xkOZDF3lpptIfx6ywtn9p4F3sEZEqv+n3pwXv0Ec0Og==
X-Received: by 2002:a17:90b:5488:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-2fce789bbb5mr17312586a91.13.1740329003448;
        Sun, 23 Feb 2025 08:43:23 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:22 -0800 (PST)
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
Subject: [PATCH 03/17] x86: Replace open-coded parity calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:03 +0800
Message-Id: <20250223164217.2139331-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/x86/kernel/bootflag.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
index 3fed7ae58b60..314ff0e84900 100644
--- a/arch/x86/kernel/bootflag.c
+++ b/arch/x86/kernel/bootflag.c
@@ -8,6 +8,7 @@
 #include <linux/string.h>
 #include <linux/spinlock.h>
 #include <linux/acpi.h>
+#include <linux/bitops.h>
 #include <asm/io.h>
 
 #include <linux/mc146818rtc.h>
@@ -20,26 +21,13 @@
 
 int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
 
-static int __init parity(u8 v)
-{
-	int x = 0;
-	int i;
-
-	for (i = 0; i < 8; i++) {
-		x ^= (v & 1);
-		v >>= 1;
-	}
-
-	return x;
-}
-
 static void __init sbf_write(u8 v)
 {
 	unsigned long flags;
 
 	if (sbf_port != -1) {
 		v &= ~SBF_PARITY;
-		if (!parity(v))
+		if (!parity8(v))
 			v |= SBF_PARITY;
 
 		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
@@ -70,7 +58,7 @@ static int __init sbf_value_valid(u8 v)
 {
 	if (v & SBF_RESERVED)		/* Reserved bits */
 		return 0;
-	if (!parity(v))
+	if (!parity8(v))
 		return 0;
 
 	return 1;
-- 
2.34.1

