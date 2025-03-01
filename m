Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DCE1E0DD9
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839242; cv=none; b=GR3xmBi+ewKhDi1CMhRoMfbE4OFV15qya2JfW3I8Pt0aHFJLNWximl7pkkTJ7XNgnS7EBLIgIPLhPruyzbahYuUWg0xuovqqzkBmS9UJLoQZn4W/GgaD52UOqXhtsLrZJ4Fti5YQGJ6Pr1Uu9A8jOZCsIcdDo6sug9s4e6FGKJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839242; c=relaxed/simple;
	bh=TwYwZvCrklNfcmQ95nA9Xu2F+v+lRRPBTM6pl81qOZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sOzC0dufZ/BIpVsYAHCEqR+vTzVIg874uYseIz+/iIAbvB1bKFirOfhpjnT89MyBxkaXWe7sC/QHXPTeUQYDbP7vFW3L0AJpu7FZkCWpyfTA7yGtkAru4wCW2DgR9yK4fJuwUmWo3COzi/A6gen/G+GGF930D5meetaq86rFXpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQXhe5nT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQXhe5nT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2238e884f72so4225965ad.3
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839240; x=1741444040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
        b=YQXhe5nTHEEuc/CF29n9Tk+F8UPiiyuyR5W6UdbjRTWm/qKTLaKzn2oqTnfUQbi2Ly
         xhqyzXaWCH9I3RMW//p01TrfT6Z/nkJE+doYJPLT01v1qPruhYYJRMBy0HWyzavIXEKB
         SMpFDGNFdaxdXgoWwJEi+kUQsXG/4seslFUKwGyOfe3bMSChvyCCY4L+izQlHgopdhmN
         pTXG2h1tW9900z9MQjFGjfo608HWb5JAOFVcg52CP9UCATGeKIs6Ik2TCXjFDseNQ1fd
         Pd7w8aro8W/dV5yfkX6WSyvGOkUK7dyZJtIlryWJ9e+NTH+Z51zxN/q1W2WfAK0j8YFH
         5DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839240; x=1741444040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
        b=Py0LFHty04qixjwRkIfLcCPaU89+g2AWzChSxNxDhLhw9pJOvb2ff51esalwRrH1Fr
         K8T7pDpteHROUg3CfvvhPdKTXI7YCi4CzAeKz+GG/NABBgIDoP1d2kmL8OV+AVMMO2fB
         jJvjb/393AvsF/9GRZRCJ1Q+3EAxPcUPWcw8JhZTVopxCo6cxRtZUSKbXcm3COvoxgvW
         bjWO8dUP8L3t+xfu/k4lS5jsjFAiL+Dj9MFDP+DEFzxn4r2ZYJiFt2HK5il1keUj5fNp
         EmcixVRsal5f3GlTzT7MB7x+rEdKk6V0nCRBYL5K2oE0A185zeQZkxNQjcmFK4faMYcE
         +RKg==
X-Forwarded-Encrypted: i=1; AJvYcCUFJ5StKtwGnaKcXTaKQIJdzx38pV4U5QZ7/dSowlYx/GmZY0fB8AGQPwBlPNU/+I5OHTIHpDBSADo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyapVToCguA4h5HxIrndFFqVeH1akbf5pt5c0SZobJWPSGb6iI0
	8V+ZdklXuuuY8Kg6SubgsbKXCpdyo+yBHPc99h5wecC1Zt9DLUfa
X-Gm-Gg: ASbGnctC8QL8iQSmmqKtxZ7PlxKtKT9erGXBoxNgqK81oYSoMFWiCCxgYLejf2iHmO8
	7L8iAwZ563QfNIwjNUgCRMUlgmmUuqtn+Uyu+qQvuA+5S5PJjdp1GbP0MAWQNOQNbTWJqqp8Arm
	lR+ihdQ9MXDPVR63tYYgol+QxOlOkWqHJ9pRnvwk0em4xkusvwDDkGVoJc2mfwMml3HWmlYuE0m
	GkXfnC2p5xQtPiEM52cC/YBZ2/AZyNkUpSx/vj/oyoUgP2nhiSCGHl0nDEo01U0m2KbIV0gXZLi
	C/GZ4iRD+Q+M+qZ/JZgTYvFfHVcUpJpWze5Rwe1wu6NDVADnryhyCMxjw1OgdLa4n0MfofoWD7M
	=
X-Google-Smtp-Source: AGHT+IFWKqiV0JEURaPP9WsTXinyvBYz5p+Da6Z0sy2B13n/BlJ3FGZeHRzY7pPlUCpj+eVU13KkqQ==
X-Received: by 2002:a17:902:d4c6:b0:215:7446:2151 with SMTP id d9443c01a7336-22368f61abbmr99234975ad.4.1740839240264;
        Sat, 01 Mar 2025 06:27:20 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:27:18 -0800 (PST)
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
Subject: [PATCH v2 12/18] drm/bridge: dw-hdmi: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:03 +0800
Message-Id: <20250301142409.2513835-13-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..833e65f33483 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -4,6 +4,7 @@
  *
  * Written and tested against the Designware HDMI Tx found in iMX6.
  */
+#include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -171,12 +172,7 @@ static void dw_hdmi_reformat_iec958(struct snd_dw_hdmi *dw,
 
 static u32 parity(u32 sample)
 {
-	sample ^= sample >> 16;
-	sample ^= sample >> 8;
-	sample ^= sample >> 4;
-	sample ^= sample >> 2;
-	sample ^= sample >> 1;
-	return (sample & 1) << 27;
+	return parity32(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1

