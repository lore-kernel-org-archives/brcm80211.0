Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984C913A258
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740328995; cv=none; b=T1C98vhftnGEvIlUeR1filcccyqLmdHoC9xWkbISInXXx7ypCPnVI8SnENBN7lF82hX5EZron5wY4mTNF5PKS4CNobz6cE+UJzZqWYuA1eET+F3dOT1WeUZBbirZWNcpRp2o3T2ld8MMqfoU501lOSiltnflO78kBFjVAQM3fNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740328995; c=relaxed/simple;
	bh=43hnaHhMRxNK7BTgr+5PulsKt9J23D55SyRDpX/bt90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s3zv3GQiZpfo6IW2RcctFiIJlUaa/6uWm8lq5uDKV4/77jEIo+xFTPJeOqLw2Km1S/lElfV6wb2ZjrbeHLLZBaZ4CW7L2VKz0Z5w1Kuk0Bd1za6udMRuStDjWbLmqgiMQ5rSp6fHH+NaDtbozqkKd8+XlrlAFfVCsX/3r0pIzP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxAZ0moZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxAZ0moZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220e989edb6so99060615ad.1
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740328993; x=1740933793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwB7nlCWtszUSdGoti59nJGyNKtl99nOClvJi35M3DI=;
        b=IxAZ0moZFCiWdkZyY3kzm3jTENDTZj2s6GigIHJ83BsSyuKel5P8QeUi5SLfoI54hl
         OG9JrYAGcPSjcWFx0ItPoRbJKMLJ/CYcSjgSxTeoGyWiFl2um01iIew/l88QLSWasrwH
         XcPnMEuMn0L9x88Ifb29jnzkz0uFFOtcyUPFDW0KAJBnFzrc8sTDaz/+9VDxZSlEqII3
         kjHOr3BY6pYpKDbVsI3fd5VU3LkKJh07R3X5sPjUf4DzQkMIx2bM/c956vP7tt2NvJkN
         w+TvQ7qb7MG4OvrNDmTAO2lm8ywPHNl+w21tZtzDT9KQJLlvUwdWy6hBYbPU6HP30zt8
         6cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740328993; x=1740933793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwB7nlCWtszUSdGoti59nJGyNKtl99nOClvJi35M3DI=;
        b=C87LCeISJAM7UEI0P3zbirGGm5Yy58TycEiIBYJVR4OVGW8MiwT7J36qpRQPZhgZSP
         NcOocUrHhC1SaQX2wYq+cTMQS7K200EdxLMrljO686CJ+KLlMrvR5AmeAbBMx9KvSDlQ
         nD3ItyIRXbQfuaH71HA0XJzFVbVS65JuSP2wUiwvjtdYo86zl0xqZHyNRoIyAIqcdtpB
         3xAeL6C80fkf+/JHhm9L1Z1vTz761fmucmCJkdrttfgmWBpxiUhgj/CuYwR3BwV8pkl/
         6Ey+zOfoj88lyudVYKOSUNKyZIRzqMnd08EkoxGFJ3GODtbr+S2axep7GMMwMZnna9m4
         pE/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmh6mTCFHfKxh/V3otdt3YAg6cmNgf1327Fwz3qtwzuMKpQc6coIV0cUPCl1yp5W3yq2te+1w0Vzk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfF+ZltbhHaLbopPdM8eiHhilnZ+RoZM/khbS5pieQsdPZ/+zw
	7TpOogEpn72snHU5Los1yNxm9MKXvA3FKKQo84ZTPu9fMDLQLt6+
X-Gm-Gg: ASbGncsSwpYwtlIrc9gEFNwv5na5zlUzou3z3BEZtU4P9HaRyGardQEEppw3TdM9Hn6
	loZExji5CUioyN5eFENK/5Es6h/H7fL7Th9PebwCf6O8RWkIR4k98wmrAaCgiXWGYFb9IvLWvpg
	j52NGFedQiN2DwP1Vpgl0tdQVIqB8flhR6pQYAls1i695eeZjU+B2vMPXHXjKsgVdodaP9stJh3
	3psEtzBCAiW6g/8URPSy1Yw6+bbRkTBh+MV3xCOl+kC+xaqpr8LsOo/LopNvKxmWt0g+PUxltKb
	FMaEYOI02GUCeSYeFfXRnwU5iJYeCCMlmq7V7kNkMuo6QhOvo2fei6pm
X-Google-Smtp-Source: AGHT+IE58QWfaLQcoNHwIYpospn75AI8MBIDPjCyLRCCZKoYKvgXR3FRMWiJgPdm5hfaVo9o7EyRAQ==
X-Received: by 2002:a17:902:ce05:b0:21f:baa:80c1 with SMTP id d9443c01a7336-2219fff2c88mr180524175ad.53.1740328992776;
        Sun, 23 Feb 2025 08:43:12 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:12 -0800 (PST)
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
Subject: [PATCH 02/17] bitops: Add generic parity calculation for u64
Date: Mon, 24 Feb 2025 00:42:02 +0800
Message-Id: <20250223164217.2139331-3-visitorckw@gmail.com>
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

Several parts of the kernel open-code parity calculations using
different methods. Add a generic parity64() helper implemented with the
same efficient approach as parity8().

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index fb13dedad7aa..67677057f5e2 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -281,6 +281,28 @@ static inline int parity32(u32 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+/**
+ * parity64 - get the parity of an u64 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u64 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline int parity64(u64 val)
+{
+	/*
+	 * One explanation of this algorithm:
+	 * https://funloop.org/codex/problem/parity/README.html
+	 */
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1

