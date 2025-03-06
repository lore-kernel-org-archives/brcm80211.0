Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590A1215F7B
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278430; cv=none; b=QEzubuaRe3sqRvJmR8kYiTTzvRydUwCNsP3hRtNIeKCKEy18jdgOc7W2A9q7mOHB6Qf7Fnu+TBjxLvREkldi4ywvC1X0/V0DxOIFqytzP93NXDe68clwE8Ro3uuwIQZ6isbVUB09MD8VqT4JN6M/FAd9xmVQf1oDpe2VU79PH04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278430; c=relaxed/simple;
	bh=wM97YBa5xgJ18K9vOB6OMMfkw7YXLYTsVU4qscf8g1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KBrE2KIO+aiWInrhVMDBp4Sszti+In47Cl6CmXJIcPbTJEGirOL7732+tCkyVV8ab1C17VPCq4TU7hv9+DYSjjVFZHA0slBYKrouqm/XU697c1pRae4yYlHS/w4F1mQeIaXxLPHNPygj89cNvbGekuiiqApG4cxyBdfqfjc6MN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvWAVRqE; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvWAVRqE"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso1638660a91.1
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278428; x=1741883228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfkeURT+EbeVrjHOwezSCAhftS9inN7HFKHEaavRXXI=;
        b=kvWAVRqE0xOX7wewkfsrwrRt3zels3upu5xRLSRNiThk/uIYcobZYTNQsITRC2CtV1
         WJO/6WRZPR31GEjWYHJChiTErEjRX+toreKHppo3LYfnBuzKGL1IFjZtsjoHUUpvVpyB
         U2giVFW9kCe7x1/FGtFGSdnVEehdriprU3EDV6YBpleiWA/dDJi2RgNB+iismALOIBtV
         bnS6v2Wwaut9Ry29QLkan7pxA+K6f7BW4zhpKyCUIs96B4rw83ot+iHz1/jGjIQvLWd7
         a+OwtTYBDy8eY2KQCvMuxlixnIrBaNR61x45yJ3MhscgQXnWOfy5khYyRKKBJiXsvQgU
         yddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278428; x=1741883228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfkeURT+EbeVrjHOwezSCAhftS9inN7HFKHEaavRXXI=;
        b=EmGVWibUboMKADlNqZ+DoepDrfBUwoFz7fviYTp6pjITtzoJfZjCgw0KQJyE1MF4zL
         km8y1wdzrZSv57yHo4WPCv+VdUCZPAo6TgdaLR7gr4G7mCOnReRCHAhRGYiCieUqhGtE
         OQZmvv/dcb2DBYXdNc/GkxY+/GSJ9EFFRJFOQ3CU6GdPDlQSfAu79nyHzOdpfF9wnGx0
         0pUSlw+jxIRC1dYQYx1Apoc9bLAHtTFgsHxgfKGrtxVkhe9WS+Rt2F1gIqKhxyhRobGA
         QwruQ8ixXSYCanAeWcO6QcCj/qhVjsRfwwATQkCtMHvM1J7L/Sv5+g/YtCxpb/IYnase
         vnQw==
X-Forwarded-Encrypted: i=1; AJvYcCXQHFOuworU60hms8BcjcpkAjXnnH48cZU5mDx62kqejIJMt1DdDqcp/C+5eJLv9x68IXY9AHEwaAQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCGs9eKQqBaGAKpdOFxXsalV0N/6m9GO46R570o786mBmm78zK
	W0TYF5VdsRDHdZO8/9FSqj09YCmuBA8T9n3+L6aowL7PcRyuLVSW
X-Gm-Gg: ASbGncszoI/Y32TtkyyRi4PA4hqjydcPU9YZ4QI9qmQaUlmERgqZhvR1vYK12o3B/Ah
	4u6DqMZY+wf4RIQG6xTH/LtjiPuudln3j+NZmQc6jQvvnhdCYvqZimYGS8bh2KUBniJQGk0rFJk
	AYNeerBnJKDzf1OoW4PfpD0UvLyoSfe6SLb4yZXkj5yZME+SG5EYQHBcXzZbw/S+6z3g8uPgNi4
	5mb9Wp2zj5kJXsTS05Ourh4Bii6A+8t+i37zUlfN66/MJqysdOeKPTcdh3vCWr8VxgIE+ZGIolv
	aengGn+UzrsfG1R7r1kx17yQPlmdPmCjf22sbQ/19zy3k9Pw33b3683245yNDDfPDqUOd3fJkxk
	=
X-Google-Smtp-Source: AGHT+IGNBcefivOmpQNsVFSdkYo/uQMo0VhzohCZYprzHPevS02kDmNn83LuER8aDdhmdhff3Ulvpw==
X-Received: by 2002:a17:90b:1808:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-2ff7b59dcffmr195851a91.2.1741278428557;
        Thu, 06 Mar 2025 08:27:08 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:08 -0800 (PST)
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
Subject: [PATCH v3 07/16] lib/bch: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:32 +0800
Message-Id: <20250306162541.2633025-8-visitorckw@gmail.com>
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
- Change parity32(mask) to !!parity32(mask).

 lib/bch.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..6c29122c0982 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -311,18 +311,6 @@ static inline int deg(unsigned int poly)
 	return fls(poly)-1;
 }
 
-static inline int parity(unsigned int x)
-{
-	/*
-	 * public domain code snippet, lifted from
-	 * http://www-graphics.stanford.edu/~seander/bithacks.html
-	 */
-	x ^= x >> 1;
-	x ^= x >> 2;
-	x = (x & 0x11111111U) * 0x11111111U;
-	return (x >> 28) & 1;
-}
-
 /* Galois field basic operations: multiply, divide, inverse, etc. */
 
 static inline unsigned int gf_mul(struct bch_control *bch, unsigned int a,
@@ -524,7 +512,7 @@ static int solve_linear_system(struct bch_control *bch, unsigned int *rows,
 		tmp = 0;
 		for (r = m-1; r >= 0; r--) {
 			mask = rows[r] & (tmp|1);
-			tmp |= parity(mask) << (m-r);
+			tmp |= !!parity32(mask) << (m-r);
 		}
 		sol[p] = tmp >> 1;
 	}
-- 
2.34.1

