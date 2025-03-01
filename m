Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A25A1E25F9
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839305; cv=none; b=F9/s2pARu8MBelwvv5UF4yfe6PE5QigRykOW+UVRtUblBEuBvgn780c3+UGhmJRv2htw1pdpaL7GxNWwtcxx5jlD+UOs9qN5/6a7TAuciwXrZvp9Qo1TRfT5uDEnfDkxkMFxkQh8XXoyzaQvwcFpV5TEETRR+I/CRFqQkHs//jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839305; c=relaxed/simple;
	bh=wv6ajOFVKcvTUlaSn3pgXaNKGIdVIim/LCFNOWca2tg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tlUh9CKR48nrvz3Qmgr36ItRQvNYMj91+57RzX05T0oSsTTeGmup5IY+EldyxGCKxDlkf7UTev5DSMOgZ8jV02UVmfGpBSZqLVZKL6sUewFX5SKpazF8fP1lkeWrowJYeRuj8C1wVHLeiWS5wjgbtpp6QA+1aU06bGKZOHvHbOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BS40G4Dl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BS40G4Dl"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2234bec7192so28701525ad.2
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839303; x=1741444103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+YDx3nsS23nFYRYOsOtDL2pw2M9KWSnqwRamUvuzKU=;
        b=BS40G4DlYFR6FF6HkhVOdnevCirPNkICvDYbfqRHG/gGbz5rCpGLaQ21S6SBQN04cI
         QgwSs1qek9iaCTMrrmiM3VEf28ZKSZKw4Me6X2aSTYTgYi4lDD1WilZd3pn9Dy4KhHBh
         I+FQSDJYSuaXsmelTc/3fPIj9KbY2d8Sjf5mOSstmrX5wpev7219B1mOi2runMDc36Nh
         aMDuaBjyx97DEJql/xmngyTwMbUclxnWI9DUqBKyYSvIxjv9K2j5lDZNXbuJJxppBI5W
         SDanpTKqIyXoIT//Z+ZKjwqPXxv3LOU3OAGE/aBCzWXR/VAlAshkLMy6JGJ3Z1NyXcNf
         Kmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839303; x=1741444103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+YDx3nsS23nFYRYOsOtDL2pw2M9KWSnqwRamUvuzKU=;
        b=g5ylAFlq1wL8XvLDGjnvv1aq1lQPKs6f+sjT4pVVRcw+2Q1ezxbigRnNQ5+pPWHHsF
         xz4tcR+KPg72S7sD50xIiPfL50RXjbJ/aVgv97KYBBQvool7xqzaHGpAglbqURnEx2JD
         v5KZcavAJ5ecy0eHawjO8JGdpYiPOYRUx0OTegaNAlEvTj0Rrkmm821cD4Up6lk91IeH
         jgB2Nfj5RKgfqp/Z5MfDbmu8yAuuKfFwKAvDvZdSVb9Ljesu+STGJNFI/9xM8fIfsW12
         OpBneLGKoQXi50NmQnY9k9mUmd+pjHGWwlzeUEjnq+Q60U4ofCWflYkrWBXyoJaHhV69
         QbUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9ELuYiImFkmYIh9Dh22j6tjHTgvhSEb2j/o9RzThPDZcA8Ph+kRvtV5CCHh4SwInpm0xM0gHasjE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYGedIILlaJ+JZGsQxJfwI5yViLlx98ouuaaICfUzsyvBvr8wm
	p7lHXi9VcFAERGdoB6Or+E62Pc7aasXRtwNrt3DaFT+J2wQN44FD
X-Gm-Gg: ASbGncsfio+pVG1o5Mbsj/pYmXfaQCUH87SdRW67J19bTb7TmgKcgihad/+beVJjGTY
	YAocD/Lj+H0dOAEQy0Z8m8cDCbBPJY6x3Z7hQAoOBgGZv86avg9ddyFGjSHPAdLr6OcQ7nBk6aV
	1M0DXt2NqmfH3h1bWNZS0Y6XoYh1TdX2cLjOi0nwY3isYgRyIvk0w4G+/v0H9a+16+3qQJ72bNY
	u2wjsXfHIMsLr0gZVpjTdM8FT+1bVI0M8r3iSMbyZwcpqb0XqJ1nQfOi7kPRjWT6AGMXV/2h7ru
	gz2wozZrU22PjbUV9quLhjnjmihhHhhMGy0qq3qIJNpiuKbg2J3In0D1KoyiOo3WKqzHqhHCwIo
	=
X-Google-Smtp-Source: AGHT+IGhHD61bMoj/kNCGfxuoRIMfZUbm2G8Vzi7r2Cl3xtga31v9ygF/WbFM3AD1XuJUCHC8w75/Q==
X-Received: by 2002:a17:903:41cf:b0:21f:164d:93fe with SMTP id d9443c01a7336-2236922174bmr117354565ad.53.1740839303516;
        Sat, 01 Mar 2025 06:28:23 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:28:22 -0800 (PST)
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
Subject: [PATCH v2 18/18] bitops: Add parity() macro for automatic type-based selection
Date: Sat,  1 Mar 2025 22:24:09 +0800
Message-Id: <20250301142409.2513835-19-visitorckw@gmail.com>
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

Introduce the parity() macro, which selects the appropriate parity
function (parity8(), parity16(), parity32(), or parity64()) based on
the size of the input type. This improves usability by allowing a
generic parity calculation without requiring explicit function
selection.

If the input type does not match the supported sizes, BUILD_BUG() is
triggered to catch invalid usage at compile time.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Place this patch last in the series to avoid compilation errors.

 include/linux/bitops.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 41e9e7fb894b..fa4e45741dff 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -339,6 +339,28 @@ static inline __attribute_const__ int parity64(u64 val)
 	return __builtin_constant_p(val) ? _parity_const(val) : _parity64(val);
 }
 
+#define parity(val)			\
+({					\
+	int __ret;			\
+	switch (BITS_PER_TYPE(val)) {	\
+	case 64:			\
+		__ret = parity64(val);	\
+		break;			\
+	case 32:			\
+		__ret = parity32(val);	\
+		break;			\
+	case 16:			\
+		__ret = parity16(val);	\
+		break;			\
+	case 8:				\
+		__ret = parity8(val);	\
+		break;			\
+	default:			\
+		BUILD_BUG();		\
+	}				\
+	__ret;				\
+})
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1

