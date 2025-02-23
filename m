Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8739139CFF
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329051; cv=none; b=Q0uLQ4Pm6ce8psyqjHJ/dSQe/9U8kKuLWBXCVsvFodEgjDpkimEZLVxfJ5u7QzWX9nH05KOqsRrXQCGac6gQIqNHkxr1tSA8aC5gWssH33JKUQO/0aktS16SiA8WLQBYRvy2ce4KQTbrH9EkC//ufTkeJ9TYzMb48HgKC99aJDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329051; c=relaxed/simple;
	bh=CbnMmjg7M9xhIhYb1IB6TOhn8N272SVk7DyDeXjNNRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lXx/nR3EAz27P5p3OddBdPKKAxKg6DpJyUquoGQsyLuicZrWY6lg72RB5GtqSqbTA7WVNCY0Ka7pmQqW2xLEMSdFTq9UMmzdklsy6ja8YLCVnCYvic2ABhMTpsdxayvKlsyX6l9ieo1wupiah7pWcGLg4suy+5VlLnUEYFo9fVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDI1GjLN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDI1GjLN"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so7384667a91.2
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329049; x=1740933849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hjFHt0d5k578dEe7TlBSwZUIRnR5xMHf3Vffd2Ioq0=;
        b=BDI1GjLNtgyVdDpj/QTKTPTzCt9H+wbXp91i0CUaUxJ15WYlyYBKWWM5yCRjkE88CY
         y++FTi+SkwtvgEseQz4G4GHPQjCj4iPLYBwqlSKsbGoe1NHk40T2lSgIVX3rxsYbceB2
         nT1HUJJONU4k6tUQRkV9Nj6EiDyqFX6RdD5OQQk54275uqmhqNNddBeDaQvYPVmXMjk2
         PE/vC3scdp8lvINUuSfKQBYGpnYeSByMfWQG0FRoN228uOQuQz+gBo9dzfvcoQCYIg5Q
         90jrn6KGVeEpwNQ3lmW4BW1pBeikU6mWUfV7I66X6N0qLQ3QhXNQtWHKJtuX9mPa/rps
         lJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329049; x=1740933849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hjFHt0d5k578dEe7TlBSwZUIRnR5xMHf3Vffd2Ioq0=;
        b=tuy6zcDzdYFCnzm5FAX2ZEFDmuUOLZ3J4cgq1+tMcJFTNDIqU/bb2DcXeG680B8Zsg
         f7i0Bpy329RW5vF6V7CDHznunrvrJ49g3NiUYgMWWdNg2ZoalPST8K4ok89BJVtGP7OX
         sfTjtHF5jaDMODFZ9KreIL7XE/SfHf2Ykcq6rVmwfI7bF+xDrIFViJuMg6DOQjrWDLlx
         CT+YyjEualsP1v+QBGCvLj9SAkDXnmLqA8rzysRFhKLDj93PhUQaVnB+YJBb3NOd4LTD
         9ztCiyyaVI9dvqigBHxBKLFTw5VU9IDbdikr5nrFcfPD6kTTwDo5iulXi3syE8SKtaI1
         dw6A==
X-Forwarded-Encrypted: i=1; AJvYcCWz/h57/mMfOGn2s0rNH0xkUsRtif1O29zteBruHCiFjGA4L3eGDWJB41UB6y6ei78RwDakm6VL3uU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv1rM4RivbOTveo4h/0imZyT8xEki1O1bDrI1pCqLLg2Y2IpU6
	iAJoDvI7BIhwF5fD1wUgeGdXF2uQTpTYQK17RKUf5S12wjSQ7vXe
X-Gm-Gg: ASbGncs1fnd2R0ylfTLSX1V0MB9fydJManNLkQiGxlhedkiQDyl2aMMpEw9WfohZnTk
	1AOQuTL/CwmaEvyIQsAZnaQLOkBYYfLWkXgd1ik+/pdGH3+mGo4pW9arNF3sXNbyldsuNv1KSDB
	7BlFjCCzIoikgrzmUxlhK/rM8F84hPN2VwJGbDkN0d951yXbfx15yEUeRBsWs+dyFw96xVv1kTq
	mocZpw7Wwal91xrJOrOBE86IzyYq+SEQmG4ha4lnDiU83Jjjv8+WG44XGLJizpuOF5K1rEFxno1
	4jBtTGEcxWXCZq1qK2pm4Icd2Aflldh/zuWfVzfOParEaci2lTUE3M/0
X-Google-Smtp-Source: AGHT+IGfwHShsfiPT7dt9SjKmid9dTaP6+iTVws9nn060cC+xpKYlrmp1TQEmd1LFjVUXo+AvslnXQ==
X-Received: by 2002:a17:90b:4f4e:b0:2f9:c56b:6ec8 with SMTP id 98e67ed59e1d1-2fce86adf4emr17900240a91.10.1740329049260;
        Sun, 23 Feb 2025 08:44:09 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:44:08 -0800 (PST)
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
Subject: [PATCH 07/17] serial: max3100: Replace open-coded parity calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:07 +0800
Message-Id: <20250223164217.2139331-8-visitorckw@gmail.com>
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
 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index cde5f1c86353..f5c487bdc56a 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -16,6 +16,7 @@
 /* 4 MAX3100s should be enough for everyone */
 #define MAX_MAX3100 4
 
+#include <linux/bitops.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
+	parity = parity ^ (parity8(c));
 	return parity;
 }
 
-- 
2.34.1

