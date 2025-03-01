Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A391E231F
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839274; cv=none; b=sBMYZxf1pxaf4Dr2NUs0aeaLu9wsx3k44YlMdmBu48ye7S9KX3Q9Y1CyhV55iiun3dAnSNUprCNJPF8lZ77lq++adnlxGMxpQ64PY6YbFAW7XeUxGT5Fq4YQH965BlUDtBw3cMGZiqBWpH2C5wWNOa3JLFrmPYykPMaITy07sec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839274; c=relaxed/simple;
	bh=9MLeZfNC/T6rZivDo76ukvYaafOdf3Bq52OJ1FPtYmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EZwkU5IxOKJvuoIMPXqcSe4u2d75uI3z7P8L3hFYF0F/dm21g4+aTw45rhtR+u053hTPq4eU19QGymq7q75iMZqV5/JzF467uUh9vJFFve0jD8Czi1T4Z6UHeRMHY+wj+LDY7LMRbKDX9a5QWa7pBiOp7aCQxLTLqERLc9q+d3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyiXRt1W; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyiXRt1W"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2234bec7192so28695255ad.2
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839272; x=1741444072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
        b=WyiXRt1WCcXgV9E546o1bDQfXrLt4/Wb1Gv9MqzLCO2dNlnD2jOULcUJ0XlV/dvBKw
         bk53hmGkUrGvnj+wvfrbT+HRDRAEz4D+H764KBLSQzbu7sX/oD3Hold0plcC/rz+DclO
         GK1oNj0V5ybkWbX5uW+PlWRHHdb1pQ16xBHUGsbPwM/9i2kIzimeYAR1nIJr6O3L+/h+
         vsUiAxvzuUD7r+JT0eQLqJ3FgiAghA8eqZyV+JNso5KaDHa7SuQ1xcoFRpPmc1Q/nCvS
         n0/buBmwGuujO6x6wgzSP1NOxz9gqxYQHOJSnWKko9yPx+VoVEaGAxTUaMF6Y1CS3c/C
         6Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839272; x=1741444072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
        b=WaFVBFqFQHOshkRt+wEm27lWXePz9DlcreALCBqyIvMUeeiIk+2Ff5qJL+3X07Z3Go
         BF2BfxagiCLQoZ38c1udrfGDy+dqmpz1J85cwwIyy/WJimuOYIYuk/hVpbxQACi6qQo0
         qxxnFOEdzv8nByKZ5eFQSXmbWc6o7KBQ6j7GNwuTPlM6gyjTtPoPE2+nFJIE78zDGVDI
         5v5LGNlS54Y26cwckqVaxSg8nJfa58SSrPo5oW7pQ7z0Wjh/tY4YupygkLM0IHiMQe63
         K1x77ac8E2dVxe6niXIe2ArkYA65y+9P2uWxoCzWE0KMb6RbhNYqPlD5jXcnA9horbAK
         tQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDaARK/4yX5wdDi+MHsj2ClVqlMZKkNFcxd9viz9QZKts8PSYMNO0qK2i6RtuPj+RiQD3oxoalLW4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjsPIp1SS+XctJTUn1XxsT4CF4uM0ny8PLOC4xRgCy509AwdQE
	ox3Jz5CIUhlWKX+dndNPhVagRdaHL3i0OH/M13vcmQTtV90hllem
X-Gm-Gg: ASbGnctc7MiWk0AOqs3G24lTtCPDRRNDuBADZjbmkjihcBsXC/NxzVy8V+/fGnB8J4g
	1NXl//qtIebbP3USuu7sk2g6xXpL0WUmAtdawU6I9bLvnfs8oOMg1rnbKbHYsNejfuQkEpxAS7c
	bCHSBluQqqVVhBqNqYMoASgONBrBxsB5fkU6Mt7HEuBWjGWNHBtCEYY6TR0vGZgj2HiqlJ+Jn0B
	Za7pvteOQE6bvDXYe+907wWeSZoQCo1e9E0ulaSYGZNR9Uy2mCJSmAyGgNVLbDT7VwO0dCFayTw
	BcyLiI/X/GR6p5Yp4LdNE/XvQDmVJIHsBlor2xANdRCf8j83dne5lmUD7ae8imr+97EMOQJLOe4
	=
X-Google-Smtp-Source: AGHT+IFJ7v56//ubfe5SZfIgarRaf2kt414B71bZC0lL5Jm/hhEy1S8FPvdkgRl1jpN6UW8NLO4j1Q==
X-Received: by 2002:a17:902:e5ca:b0:223:894e:4376 with SMTP id d9443c01a7336-223894e454dmr21360135ad.43.1740839272112;
        Sat, 01 Mar 2025 06:27:52 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:27:51 -0800 (PST)
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
Subject: [PATCH v2 15/18] fsi: i2cr: Replace open-coded parity calculation with parity64()
Date: Sat,  1 Mar 2025 22:24:06 +0800
Message-Id: <20250301142409.2513835-16-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/fsi/fsi-master-i2cr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 8212b99ab2f9..8f558b7c6dbc 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -44,15 +44,9 @@ static bool i2cr_check_parity32(u32 v, bool parity)
 
 static bool i2cr_check_parity64(u64 v)
 {
-	u32 i;
 	bool parity = I2CR_INITIAL_PARITY;
 
-	for (i = 0; i < 64; ++i) {
-		if (v & (1llu << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity ^ parity64(v);
 }
 
 static u32 i2cr_get_command(u32 address, bool parity)
-- 
2.34.1

