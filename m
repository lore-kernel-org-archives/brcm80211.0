Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43041714B7
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329138; cv=none; b=HWbyJoL/AlOfHG6V1tt8PiPJp6J51SmAqGNjaPY6haBu/3sfX825OaXNBSPtDSlrNken0snyQZlHWQIkZuVSMN4Jw1Yfw/9xhW5e9HRSeeAe2TwoGq6O2enWGVrqTz1yWdH0Li1UTu0/NWTo1rzQxWNffb0sjzIXxa4UNl2/mjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329138; c=relaxed/simple;
	bh=9MLeZfNC/T6rZivDo76ukvYaafOdf3Bq52OJ1FPtYmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AEPSAAoAf0cHolTmBdr8rIMVkGwOk8Q/J16olvfkjXaw/naOIsu+gNG4s52pPJyz/3yeQ+QCcGm72lnwxqU77MrIm9eXdW4XQg/PjqKKn14yqxqYo0HaDSdGacF2lSZuBsWUx+JeBKf91Gajtsl+UUJqOZQWyE+R7kOJdlcWDfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZU3wVUDQ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZU3wVUDQ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fcb6c42c47so5665202a91.1
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329136; x=1740933936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
        b=ZU3wVUDQZ6Sf/ad0BI1MglM6k289qOXJB1Ct3tCa8JyfqFImerbyOrP25SjG1jP44A
         W346PqVxnuRv/9DCdb4kBt0XRIqrIrdHN73yiNpv+bQQghrjd9+xyIhJMpZkaTfm2rGv
         hq3IpzTptgNvCvZzlMZ5+kK2vCzpMgdw7Zj10n19qKHwlZgOulrMFpbi4Qt1z3ipjF2C
         pwOuNFB0UOZLT0hGrTbsfzlbpEQAPtJx4u5rwC7yradn7BG4Jeo/b+8KOaXqf82zK6yP
         i29lE78uIFKcV7D2p1VCAv0acU3yv1o9PQpZh9WCeHJBwG1bMwep8K+Y1UcC0Ine4Az7
         G5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329136; x=1740933936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
        b=mgZMS/vS6vfoF0nz1TgVRS3w9bfXmsfJ7czUrQCkOQMGQYWFAnAIgFnVu9omKKs261
         iy7ULTkxqRmnARI9TdIOFmpjwfM95nVL2tTIicjsuLTA1eJxpTv1dvGtpKr+SNrfYJqv
         RNBRu6HIF/mzmh3lotPMtAXb9DnXaeZcZj4keVsBEdas+BCX+oTEVfLXFL7cwWhknmoc
         zB00aKUEEOZAK0POBHjLo3cYLZQCz22KLGiz0xYMuYLLdCPxh1Q4zIuQ/zRZPK5ViFbD
         gK8fPpoy/0AbkxYoHueezoor7zJc6UD+qEhUNSBB7UG6QG+dPqMZq0mYMXup0Cb94ix/
         Eidw==
X-Forwarded-Encrypted: i=1; AJvYcCWRdIXo9m/Sx95C950k8xP2rJjiZpM3Db6qWgN4KdcIPreUZKuQBOm8xa5HWSZfcrbuGgFLYY+OX4o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr7hc1vlc/wjKjkR9gRwcxKNLJWjGXycnbmuNp1qJATsg01Lk/
	nvi6tYAKAI5pSbdJ3Y21sL4ELvCnii4jDzc6y8zMRQF3oCx1EVAb
X-Gm-Gg: ASbGncu8Kj3x52KFXYOaMB0AfEp3tvW49DhjTW3TuzygWOZp8Ic6XFwVDveZitwte90
	rXj01q7XpJVK0auWobJeta6vEAVEIwDqYcXU9FCMjL8oLcyjSpVHHxKGHpDgV65VCVs8+c4n5w5
	SqNcFG2bwts/fNgVpe7p+nDx3psAl88XFUsh+4PbxOYI6pPEb2n+zH9Aq10hqITRWFx1J/KHOgS
	+rM//bANpToNpsZyWIq4NxHDHPiYcXe2JhCIJWH4VW1DB14C/ZjeUWZHjFp+EjKLgb4aal8YiVH
	UO39nxujFOOfaaOhdtjhUKoXvNhsOL1F+LbwibF+D7+2XZrCRsJyj/Bb
X-Google-Smtp-Source: AGHT+IG/5m3vxk7XH8yJGRjtosKFh6pQvnNnT6e9O4ZXx67836JTtD9gPOQACi8OqZVBfLdHsuq5WQ==
X-Received: by 2002:a17:90b:2e0d:b0:2f6:f107:fae6 with SMTP id 98e67ed59e1d1-2fce7b1a82cmr15222650a91.23.1740329136041;
        Sun, 23 Feb 2025 08:45:36 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:35 -0800 (PST)
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
Subject: [PATCH 15/17] fsi: i2cr: Replace open-coded parity calculation with parity64()
Date: Mon, 24 Feb 2025 00:42:15 +0800
Message-Id: <20250223164217.2139331-16-visitorckw@gmail.com>
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

