Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DBA1ADFFE
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839138; cv=none; b=i0PCy2rNgyP4P2tUwQYU1aQJzGR4RGSvznZNBuDVKVqknuHHTyUskYmTEBn/n5tVzP1dcfLAO/uJy3Oxq3hyfnboA4DPvprlQKV97f/6M8/aQldByFbbWLcia/sTljfv7TmpzLQgg6etg/taWzQboEHtBpD8+nlyOBzjjF0UtXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839138; c=relaxed/simple;
	bh=Hp0hGvKZ6hZDXmPlOHysECp6knm016n56jHAcRs/TUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OFgU2Ght9hCN8eB5JULOStFjNJUpZc1OtACZnQdmXWulX+8+8K8ohiBJe1d4EhwWi0PllXrsxelREJyH/4boSreKCprOu/Lsu5S8XYOn8QvQsvKbUgyqRFI0zkgPSG4M7jTttL643E4kuTefxSAqi3fXp1etcLUMw83WE/6b5S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcctvJtQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcctvJtQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2235c5818a3so14252485ad.1
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839136; x=1741443936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DnAEglK79Mk3omljF0fSTgcHsRTccmWpKjUoP5FAFM=;
        b=BcctvJtQXMqLwrxIC8sF2yApEfGP7qRekXMs5LNQ7nozJvYuVcYdV5qlsRMxk8fA5K
         rJnQ+Ggva8GP8Yjj3foph3VZQyBANPEy8nu9j6wtKkVZQ6UeeL4VzWlP86srAwIKc2TV
         wDwab2IbV1q+pxPWNee59LMnnJsYVfWvXQyQS1/rIlawnaXjaBy60cDPIjERx7cj18H+
         2wLNWV3+I1u2dJTFNjyDyhCXCodXdPRtW3ougSU+NguCveoEVgrosdvhpIyERN3fYeVz
         FfknvCb9f6AJE3YM2sJOXdZ0UzabMcHNVu5xi+YpDdqj3Kyl7BqLWTqsYTLz9vl0woom
         gMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839136; x=1741443936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DnAEglK79Mk3omljF0fSTgcHsRTccmWpKjUoP5FAFM=;
        b=qBNm2U6tO9datEUFEEPlLl1JJB6NQTF2Fr/t6IsxzdrSWpkMQI5PrMG+SEuTMQQp0x
         XWWaUsGw+Wqf99/Rl0SjqUd+iLT/hVb9D4Gx68cvafRg5pjKL7D5Qd8WN7SOb06wQ5E4
         b0lPJS9ltoYwsBIkqGA8diaxFvt/qe8wQAhzOkb/B6lxIx8tXCIRjjk4eRZnYN9kSS0K
         EmJkVIHIWQXdejyMhtr++MdKIW8MID71py+crl7z79H76kMHxvBw9PJ8EDOgv6OeSptW
         DikvYourMYpZA/GaFs8cAK2b5o0YZkZ1RfSy33xAci9wcmaMhLl5Bvd6SBx13DrQVN4Z
         TzuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoJmJzYZuxgmRXBOHydZAYkf5XGXyAvfi3zMDfPCnbuaf0nL7BTIV++kEbJGyBvpCs8esddFfJAQs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy166BJjeAaTywa8RF70Hmz1erqBqetLXln8j+HBpc4W43qwo7I
	wTrhNlMjzZp64Oqkh3tcP49ikNQpTs9mxuRWxjE9u19G0mQPP1DL
X-Gm-Gg: ASbGncuWH5HmEa5qmcQ92K5w7Ntjx7tX97pCtecbDnZyBweqRgGVDRYlIvQUNwW7d+B
	jalgc1e+KMWFnrvP2UIYgzdPVCNTvoQL8DqeXbFSaCh6mssxnNe8L3sdRg3/Y4sKCkzqlFBhPHD
	+9/nLLGtXuaBzoBa+tFywhIxlTYE73rVUyraAwYcJAI6qYWVZljaxTkNygH0JJ6nv5sHuJgtVkS
	NtfyRRf4ii1s5y4C97b+G16zSVE5xFDB8xbKW1io03FI5IgEI6627Qb22yBcwdLJVScOMawjt5I
	Qe2UrdQThKoZvqUZfp5cu9il5Wesfcx8+ByUF3J+6ajVUp6DK6v6rQYaq2IjKw55LVXLrx3BNWQ
	=
X-Google-Smtp-Source: AGHT+IFRKRz4BN5AxlaA28KHfZNYjOTMLj0QAU9lL8VlPLbOS4h8EVG2ykvV/etQT7fBRPoRmphS1A==
X-Received: by 2002:a17:902:d4c9:b0:223:5240:f831 with SMTP id d9443c01a7336-223690dff12mr91198085ad.25.1740839136548;
        Sat, 01 Mar 2025 06:25:36 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:25:35 -0800 (PST)
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
Subject: [PATCH v2 02/18] bitops: Optimize parity8() using __builtin_parity()
Date: Sat,  1 Mar 2025 22:23:53 +0800
Message-Id: <20250301142409.2513835-3-visitorckw@gmail.com>
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

Refactor parity8() to use __builtin_parity() when no
architecture-specific implementation is available. If the input is a
compile-time constant, expand it using the _parity_const() macro to
enable constant folding, allowing the compiler to optimize it at
compile time.

Additionally, mark parity8() with __attribute_const__ to indicate its
pure nature, ensuring better optimization opportunities.

This change improves efficiency by leveraging compiler intrinsics while
maintaining a fallback mechanism for architectures without specific
implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..4c307d9c1545 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -229,6 +229,27 @@ static inline int get_count_order_long(unsigned long l)
 	return (int)fls_long(--l);
 }
 
+#define _parity_const(val)	\
+({				\
+	u64 __v = (val);	\
+	int __ret;		\
+	__v ^= __v >> 32;	\
+	__v ^= __v >> 16;	\
+	__v ^= __v >> 8;	\
+	__v ^= __v >> 4;	\
+	__v ^= __v >> 2;	\
+	__v ^= __v >> 1;	\
+	__ret = __v & 1;	\
+	__ret;			\
+})
+
+#ifndef _parity8
+static inline __attribute_const__ int _parity8(u8 val)
+{
+	return __builtin_parity(val);
+}
+#endif
+
 /**
  * parity8 - get the parity of an u8 value
  * @value: the value to be examined
@@ -250,14 +271,9 @@ static inline int get_count_order_long(unsigned long l)
  *	if (parity8(val) == 0)
  *		val ^= BIT(7);
  */
-static inline int parity8(u8 val)
+static inline __attribute_const__ int parity8(u8 val)
 {
-	/*
-	 * One explanation of this algorithm:
-	 * https://funloop.org/codex/problem/parity/README.html
-	 */
-	val ^= val >> 4;
-	return (0x6996 >> (val & 0xf)) & 1;
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity8(val);
 }
 
 /**
-- 
2.34.1

