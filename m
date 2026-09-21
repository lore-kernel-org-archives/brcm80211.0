Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5155502764
	for <brcm80211@lists.linux.dev>; Mon, 21 Sep 2026 21:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025504; cv=none; b=PW2u6+93pzuND0Lamo5ff/3KjZKMQtAh65TcNSU9bZK/Tel+SBNLS20KHOOtDWqCyJ7H8YU2r8SBAhdRI6lOnpg+6ItSdyBE8dDeFwj5FTIvJyBbubxfUWP15volB7nklnNiU9f3xl0LENY/55KgyxN8IqcMj5lHqqU1yNK/U1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025504; c=relaxed/simple;
	bh=VRpXZvIUbinbYCp8XtmrFt27Dn7YUlcSLIPDdw8ygUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZwUUepMFUStGZduf1pNB9ZzL47/5sCQ6UMXUhtbXeYb6E+q4x4GlIZSDIoPxWzba3WB7GNS3rDNTXcUYS+rL18w9QSJaFEEG1KN4a6CSojElDe69LayQ+Pp03ced+AeZI+yTVKO7VT0sMwRyfBgMbK0nLax3/REZZ476u6GczY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=qNtbLZOl; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="qNtbLZOl"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532d63f434fso9642501cf.2
        for <brcm80211@lists.linux.dev>; Mon, 21 Sep 2026 14:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790025502; x=1790630302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnvuzFJ+dz4WWctMbBwhpqeLCGhBdru2A4mbwIW3v84=;
        b=qNtbLZOlzUkgbghji0bmJH4r0A6k7u3di1x21qTNB6aXd258q5GXM8ZbyvtSXt+Sy7
         EKzdhTYK+zOUfDt7vSJPWYVxB+rkkiQSgtW/5y6vlMvpJZA/Bx+qSFI4+JkOr2w6k6/E
         FzIGAsblNcXD6dw7vvDdPO8xqLw8ew2LQw08NzeAcjuJy0m5+Bd24ez0CNVB5yEJQVlJ
         tC41cq23tlN2qAMILRSNeBsrFWq2Vy8kSXUVsCcJV7hePYROUbxsxsk8jDhVxdVDHyR5
         kjMzcuUy/7TIFbF97egDiA6omHL+Bi+J+qibdHuCet2EGBFbOMcLEG5Ga3e1vpiPswHz
         35Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790025502; x=1790630302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnvuzFJ+dz4WWctMbBwhpqeLCGhBdru2A4mbwIW3v84=;
        b=qKAcN9wSxLZIavOav5sLNhVg8UmKe7YNddhCWnEIPAz80QQcV85QDxPn4CWM9QiBfs
         ZJuu22HrsFeE35Ay3OBwzgtG7ZFVsLjzwckvL1yg15pJIAv481jGHdNAqHo1aZaDSJLU
         Zi694fLf7ncIZa/berBcTuCvWyFz8yDSaDoX81h+JNnJaSN3c8NQRlllxLVHfLB7kyyI
         5M/Vf5eU414aaQ2zALXlH2m/IvJ0lwDJNlzxIGLSi1sOHO3tyh1H878jCeQQqWDZAta2
         +DvIH9Lyn8AQUu/Lm020REW/XfmiEMYCrM+GzWwZyFf0VHNWuUMIGzhTfOihZ9XUe4Vz
         +XeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHabvcqQqdobV9tQVkJVbfxDG0/NMZnIiNmcthLr4H3GioXrWALvw+AAqqg2QUfTtXi628WNc5D30=@lists.linux.dev
X-Gm-Message-State: AFuF++nrKtJBKFTCDPCgQf7/30iB+0xg3dvtxcVylHBFgj4QgsgXyo1s
	+pJecDd/yRM4geu1M8DH6b2JPAAyhRxd0j6oHLaQSMpoxai+PtjLUVcA8XyREXP1FUBeEsdNgdz
	Xb6Sx0t1KpN70GuuYuQZgszS0kJLsOpTUSitVPcIx0Y57DGyeGvd8KGs=
X-Gm-Gg: AYBFou1ay9CvoyDqJeGAKxlNdnKx+CqNcXX7jgveuaulamlyda1HeS1ZGneBPPP4nWC
	OMKh0WFVuvbU5MbRZMt+ccTbNmLWE0pz4Tzfy1OSqguz5LHhB2DCwuSvuQyR87YitXSOmo1ey5t
	kfhdqYMGusR18KwqOlhm6gqAJpgmIOmpLgXVA7djLzVBayQ+47u0ie4yN3YINTdlZtW7yCKMyaP
	X74CKbJ5kTrxkQvB7S+NhLrmvGN0nXYs2QOWBHnemp0sKLmugBlFl8HJrByo6b6FoL28hV/JsFy
	bqXSfkkf/D1+B1pGkIwGiJ3qcX06EKzS6gqxpw+u23UecsiqCvwVfWPDmJ8WqeQb5CHkJoBOP8F
	dZpgoOEN1UBJB7dTiHlodIqXJ883lSG5FWFujm/SpBYm0Pcnkx3/7IoF6sDS+ppjSvAE+QOOTX3
	HHYb45b/18T0FS967zpQ+X2iyrT9LjfYGT6PGDF/APIqetvUIBGZWkSRSLM40x2y4RPiJaLyeiD
	l4=
X-Received: by 2002:ac8:5e4f:0:b0:532:ca19:afc1 with SMTP id d75a77b69052e-532d8d8a849mr27485671cf.29.1790025501481;
        Mon, 21 Sep 2026 14:18:21 -0700 (PDT)
Received: from strozzi ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532df63ab0dsm267121cf.26.2026.09.21.14.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:18:21 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	Sean Anderson <sanderson@brivo.com>,
	Franky Lin <franky.lin@broadcom.com>
Subject: [PATCH 2/4] wifi: brcmfmac: Fix brcmf_pno_detach NULL-pointer deference
Date: Mon, 21 Sep 2026 17:18:12 -0400
Message-ID: <20260921211817.2432341-3-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921211817.2432341-1-sanderson@brivo.com>
References: <20260921211817.2432341-1-sanderson@brivo.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_pno_attach is called when firmware is loaded, which may not have
happened yet at removal time. Skip the rest of the cleanup if pi is
NULL.

Fixes: efc2c1fa8e14 ("brcmfmac: add support multi-scheduled scan")
Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pno.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pno.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pno.c
index d9fc94076791d..07d195e4d2832 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pno.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pno.c
@@ -533,6 +533,8 @@ void brcmf_pno_detach(struct brcmf_cfg80211_info *cfg)
 	brcmf_dbg(TRACE, "enter\n");
 	pi = cfg->pno;
 	cfg->pno = NULL;
+	if (!pi)
+		return;
 
 	WARN_ON(pi->n_reqs);
 	mutex_destroy(&pi->req_lock);
-- 
2.53.0

