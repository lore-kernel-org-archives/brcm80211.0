Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D39152E02
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329073; cv=none; b=K/sez1s78HQ72++g0Mc5CpV5ry097QhQiUzdBQ8EbkrWAQzTWWBcUgTkajP7zYfc9RsWmURuckbwzMXldNXcGiPbvgRSJRx0FL7juuDGYl3GHs9SkiSyP288/jzidj7Qa2F5bejQ0V/BK4MBFlUOfX5q5SwyjLE9C0dCETS2EmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329073; c=relaxed/simple;
	bh=1i40o1s3Vqdk2RW0JIo3piubrRjz0Cy5aa5u5siB9VI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dkYtLeQFPDppvDtWI+YL3eQl0EM9nVbjll91kFCR420UyXJ0nYep0jvKpgVCrver4l8oG97wlX+wBLOITu+DJ02TamoG6FFmXiAMseFG0b7Mfuc7XuwZhlZ2Ew5FyY16IffldNwjN6riEn5rs+ALoebkulW2MP2Wusr0dksxJCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9WL75Mc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9WL75Mc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220c4159f87so49596155ad.0
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329071; x=1740933871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
        b=B9WL75McAE10HIyP4xhdLEOdXeixkk5Qw7/OACQ1cIWSQfu0vg4FCabj+3fz6ucdCM
         FKKVrz4cuvjzFqsAg7xZJ2EHPZNkPoXpmuqyXmX3+haGcUvvqyqfb5ouymqRq987Sdus
         7hhmfJhLgnRrcYvKkpUIfct/o/qi7ZYY2fLorouebO1QQ9uNw2Qzml+H0xQt4BH+0CzP
         0JLo7Sgaiux12Bf9BG47+RPrgY8JR49yBRlSsxewj3H8OCe/JOXrgX7Q8GP0NIS06mfy
         4x0yktX3iXRuq6UMV+K9Kkp3SomOXj89REA9nf1sz+zDzUDYKdX9lSfKVBk1MozU0tED
         ClZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329071; x=1740933871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
        b=HCn93y8dd1u5k5MYNfOzvL5Qz2vA35l/EzrHIsf9UdeJmEQUYLAHfm9Bf3YiED84jq
         MYEipAV8Shl5izkbDYU8jSFQUM9RnraXy3QZZ7v7x6hCEo0GeToNp1E3au5nojR985Bl
         vb3Nbz4g/C6ZkK4paYc5XjB3JJf6F3Gv1D8UhR1z9FM6Cv6kEI4hBY4Wdg0xWo5LQanh
         YIYMZJdgAcOQkp9X178bYKQOwgOWwNMz1AGzQosE9l0J+mTPFwhow1y7TTQsO56lL01H
         gOYsDBnqfzHLO+yqzjyFsV0SWbwKMjt4LVgrgVQNirYNdn/wS6OETMaq+orDb/XZvFpP
         NfYA==
X-Forwarded-Encrypted: i=1; AJvYcCXtOER93/T1nNoTPUateBuwi3j7yt6MTw0lN1UU4TE7xx7yxceXVRu3GajOypwJB0E1rcKAN5UcUdU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYxV/1CYb91qK12MQkZLXvGN0/MDFMj5ZS4dfsi8WV5iETTe2/
	nwvaQMe3TtgpE/8NFDxrLXmVpdI75dhWKSmNd0ot3W/uvwptXl1Z
X-Gm-Gg: ASbGnct6g7GWL6QLtWHbL2HA6mxmm6FcwmMx05YE4gNgW2Qm/oJUPasf7aL+RoFlybC
	2ZNmPmxTqv76KT+G6FvpAl0MVH6/FDHI5plgEVgm6TTviD0i7zQE+YFtbdeXFnECM4YnI6tWtX5
	Fbe0iWOXHKpoHg8MonQOYEh/50hRbrZrH1KgyIa5prDiO1/ybUbyRwADgRnhi1qbJQRgW9AVhHd
	jDzp7yt5sJC1FiudQF+fX/CHCnf1G8asVoCIZY/jfriaQKRdueRtDfiEhqPdbS1KOeNHS4FHidI
	H8uXmjqA8J/09GvvcyTUvvQHmdf7Sxj0Xc+JnZja476WcOJjlRGy2mEJ
X-Google-Smtp-Source: AGHT+IFqMPtN+gPmr77Z5+UXqcepcxQO5H8AaDoUEcywHGCumZ53dM6PMFmuD7xMrlzO6YmaaybKmg==
X-Received: by 2002:a17:903:2286:b0:220:cd9f:a186 with SMTP id d9443c01a7336-2219fdc2dfcmr186405365ad.0.1740329071014;
        Sun, 23 Feb 2025 08:44:31 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:44:30 -0800 (PST)
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
Subject: [PATCH 09/17] Input: joystick - Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:09 +0800
Message-Id: <20250223164217.2139331-10-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/grip_mp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..897ce13753dc 100644
--- a/drivers/input/joystick/grip_mp.c
+++ b/drivers/input/joystick/grip_mp.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/proc_fs.h>
 #include <linux/jiffies.h>
+#include <linux/bitops.h>
 
 #define DRIVER_DESC	"Gravis Grip Multiport driver"
 
@@ -112,20 +113,6 @@ static const int axis_map[] = { 5, 9, 1, 5, 6, 10, 2, 6, 4, 8, 0, 4, 5, 9, 1, 5
 
 static int register_slot(int i, struct grip_mp *grip);
 
-/*
- * Returns whether an odd or even number of bits are on in pkt.
- */
-
-static int bit_parity(u32 pkt)
-{
-	int x = pkt ^ (pkt >> 16);
-	x ^= x >> 8;
-	x ^= x >> 4;
-	x ^= x >> 2;
-	x ^= x >> 1;
-	return x & 1;
-}
-
 /*
  * Poll gameport; return true if all bits set in 'onbits' are on and
  * all bits set in 'offbits' are off.
@@ -236,7 +223,7 @@ static int mp_io(struct gameport* gameport, int sendflags, int sendcode, u32 *pa
 		pkt = (pkt >> 2) | 0xf0000000;
 	}
 
-	if (bit_parity(pkt) == 1)
+	if (parity32(pkt) == 1)
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
-- 
2.34.1

