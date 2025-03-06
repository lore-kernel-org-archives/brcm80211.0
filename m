Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50E921ABCD
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278470; cv=none; b=hNQqfjBijUv+3Fj2trR8s3cVIzp9UqKyo1QRFqwyp655jSn2AMP4vfUM1Ax18Q1VgT170FUETOvfuL/To1IvAMTq5K5WShpDUBcEmr3kzn9i23q7WtEp0ExGUcOJGOl4XwBMlwc76SJytVhrpbU8bJ/uDC5yAnEJudtFz6dObcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278470; c=relaxed/simple;
	bh=kbOoF3icqMO5cD9NY+9tgI31+VIx+Biv/oapmdtrbUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VaxKNLs9kafwL7WPPbDXFxeINuQAgBUefI2DWQ/Wa/ICiJNFF4x/BZ6wT47lOB4z0un8NnkiJaj/h3vqTwAcYEa2pLp5KQmG1BlRjC0cG4OCDv5JvBHPGsWFS/rmhDCsuw8Ct13YhBJZt6xKf2r5Rs7rm+xINfQKm8DPS6AbPOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMYsOocO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMYsOocO"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso433738a91.3
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278468; x=1741883268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lzzZDV4xgSskf5edAWcKAl1UECahSIOp1fWE1tA1yk=;
        b=mMYsOocOuLGGwgRxXyxMcb5MWZ/m1BwGg7E15SPEbVSE1hb1feKLX0Ya5jE3X19jAI
         uH+3tie/B6nhaDViTvfoDr9IBjg8vb0WcbfDOZq2ls6JE1FqsNZ/oCraWu2VTfkeOKBS
         Ha17p9tn1Zl6bnOyy+SxP08KB2df6D2/GymoRIylusUqXWdvygHgTFkuloXROLsXkfOx
         dwfbJGkjYyMXMpRD4DdgS9Ti0L79o3ebDIojHXsaR2Q3hIeF3rNxJll3aXXJwkOh7Udh
         r3mNeR865A8xnbYEuO+kGiieY2PpwDiLk1TCavZNJBJufttUjig7urJO0bLyUfBPseja
         MWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278468; x=1741883268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lzzZDV4xgSskf5edAWcKAl1UECahSIOp1fWE1tA1yk=;
        b=rNsJ0Sn3eLVFsw8h7ahG2fSbSlmUQPGnTbV+2kUOkybioHuB7OZwTQn0I++yx9LdY4
         Ht2qZ/6uaEnxHwI2Oxy5BiJufWyQgpCneUhGrKaHmKZGEDTZGVQU+ffaP2DJNpJxPfMF
         4EOQMlI1SUQ3Df+OIzpVQUlALmFhEbrHTc2JFlogBPlw1EKQaMxyQPIHFOgqQsGRgArY
         lj2Dx0+mu7WdHD7L/VerUG0iUxDuQSwiiBU3Ht8RDnCnTPOJ++DfOnTlYHhb4JPRh1Xc
         HhfCo2QS0ayKdXxjWso41RXNeqoGDpFysy5OkX2yYPpeFZc6hpaVxG7qK6SjWTcLYXFk
         wagw==
X-Forwarded-Encrypted: i=1; AJvYcCV3hbI+Uo5L9ehtjEkrHWxeCahIHeFTMBmjjWhSRY5wm117d4gW6B1KHaWWfP/klWT6nRSMwNf90Mg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWQJru4Naufpc0Gnqkh+SpOHWu7mOpQkONVU24Sk2KYoLDXiFP
	RCetIByQTKAG4QrYpArC5g+NgzL/gFjUEMCACUOhF56HZjxbqRus
X-Gm-Gg: ASbGncumXfdTCn+NLG42WIFXU2TzROZpbUjfq0et91HfKltiSBPQHr1GenU/R/izqMM
	JL7whKXTWaO8PWCvTkBYT8myr5slbrv9y+pe9ohJXLr29WBnn6P20c3bpVU6lxJFFDFJDK+mElr
	603hvNAJ4VH+yZeHT15F4D7NgsXy2UxrkWfVjpNB3W0L/89xqfS994j6r2IagnhrYYt44RImVsS
	dNrKbAFLdVeXPjD9P5656fJBhQdGRVIpqn+4qOz39Hh9l639Z4aNhJ1RdzBpkfCagZV6mMgTxJS
	jq8BDImLZ/CnbQokz+ZE9s7kQuC702ie49SCx7slDxbQYy+kekXO3GI+8JWXsyRolxTo6U6RDnQ
	=
X-Google-Smtp-Source: AGHT+IHWBk8+6ksfik0EhK6cGMIWVO4KCt6lAGGIta1FZHsm7ob/3ELoZ4FHcMM7AbzddV9ZAUKTxA==
X-Received: by 2002:a17:90a:c888:b0:2fe:a77b:d97e with SMTP id 98e67ed59e1d1-2ff49728368mr13045551a91.11.1741278468014;
        Thu, 06 Mar 2025 08:27:48 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:47 -0800 (PST)
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
Subject: [PATCH v3 11/16] drm/bridge: dw-hdmi: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:36 +0800
Message-Id: <20250306162541.2633025-12-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
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
Changes in v3:
- Change parity32(sample) to !!parity32(sample).

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..a992ecb149d7 100644
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
+	return !!parity32(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1

