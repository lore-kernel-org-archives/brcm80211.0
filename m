Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E228267721
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213595; cv=none; b=u35J1cjT/2Erzl2bhAi6YlFUNnCHbOnptYmo14Ey5qeKGqll5ctdfAlHF8E9eZWcxkbExz4aBxNnb0AY2YVKfDsXxIqNvfSBP7ovwksHbaVfiKKcHJenE3jgT6aus8X/ewwRYvyeIrMSrVpv+Czpjk/lJSd65a0UqYfhTAHoGt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213595; c=relaxed/simple;
	bh=QBWyEkuiMWNVhDuO1rQlnUBmammNz6BWECv9ZgXDmxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HvfGJuAXMXDly/lC8K+jiivUnMpgarrFrswxmcv8MeSsRIsBFNkTKMjbcAIoRe9sLoLxPXHkznJCncM7tgYscXRxZNnLikU2Y/4dszjREsJtT7zdslba09XpIzTwsZBlg4z/Nj7RrWLl+mz3GLY4Bcxy/6rXLOk4NDSZWmLt2kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QePmY/u8; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QePmY/u8"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ad51f427054so4793272a12.1
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213593; x=1744818393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxwU2Eo6SZITicqBQinN6iBaz5ky/0lGxu1bDy42GZ4=;
        b=QePmY/u8RIYp97m/yHSisAa+c+EeIkkcUUEmex6AENFf13i2bqBhlhUo8qNErjvRXD
         BBP4ockOiAqhJfdHN84VPUP6VhrJgY/qrwi3OGGuMmFgWxC8GYqKPBM4t1akNhNpJ2Me
         qOSSf3U2EPi4XUnLM2T/Zp0hovC3u83Krqcm8/jRUJ2LiPXJLCQLSPLW99LiFW9yKn3P
         xFiRiQiLrxbe+bWfotjwB+aJlCHXyPMWLXMGu0SUFMRgo2pXFYmZzWsCHpshzQvBQnu/
         15/Ecu0qW1E17BttpFwWN7k2cVXL49jM4bFb+uox1rEq355AAJXULD5UEQJxZUwyaHC3
         Mi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213593; x=1744818393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxwU2Eo6SZITicqBQinN6iBaz5ky/0lGxu1bDy42GZ4=;
        b=AC4ZnOpGofZIQkKu+ts6MwAGPMqaq3BwbI9aX+pO/DcWOolm2jq3hJyovZMvGvVt19
         83wuV9HAGH1hVo5Owe1n20P44hKwSCdasBRPvMo/ygs/ihr112yXkw78QAZxBBa5eyGa
         rzudKrVGct6wOlCaP4OChx6LYA8b0nyp/orRVlW4vIg+dQ9RLcvaJNGlDpcFLEpbmjUT
         /KwufdpOlUGh4ltKJSFEphYWVwKm83iUX5sIvWxs9bW9SW8LNzJNJ++femEqsQEUrFOz
         E/sOGBAfrI+Sb/wZAchlKE6TE5YmEgrnx2acmGJCcdyFtV5BJObB9En02dQCtRIfrLXy
         oNPw==
X-Forwarded-Encrypted: i=1; AJvYcCX8mD0l6SQfHX4Cd8SzNV6VN4z3vZTYAmRoT2q6gsp0kAoUNLdbVTdt2+oV6fnSfYzskEjdmCfpvGI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMm6vGoNDqRPDLzjW3FcBybBNHvJfhvddJ6Ki5vAgfMmoPwrMW
	C94WNTp4LxfiFQktOoWV7DJB1rPNnNUdfZmd1MVsjZIzpDwX5smd
X-Gm-Gg: ASbGncvhYhcHvCRVB2TPsoFn3eJg3mM8rsJ9pjaufm3FgOQbWQcVJoGcC0TnOZhJmf9
	5ynBdimKDQLBntoq652BwTg+RcJXfxakih1ug9wDHIZfGTqBZfMSHWKHud2UrocVFKhE7PDcJ5L
	8U41fwI9xoudz0F8S7/JuLo/5HhNHUGAn546FZ8B7LTZ6mHMR09VpgZuhk1yBQK+u8cxb3Cb+qW
	oCzSc9k9fsRoVMQAaBdlbXCoqTKFvzInAcS61gJ2vxMu5zcUG2nYj+CTwTi2+5leD6mFXv5NUBT
	Lnzx5Syrq53wQeG9p2bIwnKE4WW9RPts1EQXyFGzQOFvLs6x3rtQOfit5G7yCvd+mRFS16s=
X-Google-Smtp-Source: AGHT+IGJskC9aR+5Dgsn/0q7tVfn/b9wEb0pUAkxSpjYPK7zbEkvmX2PCK7JdW0DCG7ccVky18srmw==
X-Received: by 2002:a17:90a:c887:b0:301:a0e9:66f with SMTP id 98e67ed59e1d1-306dd521d88mr4820575a91.14.1744213592804;
        Wed, 09 Apr 2025 08:46:32 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:46:32 -0700 (PDT)
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
Subject: [PATCH v4 10/13] drm/bridge: dw-hdmi: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:53 +0800
Message-Id: <20250409154356.423512-11-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..abf2c72be622 100644
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
+	return parity_odd(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1

