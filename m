Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D11411665
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501342; cv=none; b=f64pVdpPZyFbq5imW0zjg2Q+ZAm92dpIVw3vK8LtWsakPTsn0VJLOB8C0TCcySbi3XizT7xAzDXqVnFicO/ZS/VOywidl/bn08rY3aQycEabYX/U/xZQC/49bR/HfmwZOazFFdPMXTt3iaU+E2B8EFv6HfFlXgeS0mMTFUrP4Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501342; c=relaxed/simple;
	bh=K/DdBaFpWrUAJmAtsopPn4EUPsSFubMdKIv6WaVvK2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o495ciKvuRAm5MN5WDY1lOTe7x0252Ee9BA1L0O9DF7NN85EEFC1UDALgP5V9T2FgmTDTD7tNS3I608OWf7UQfjyz64FCxl1UtFCrJLUrLvbT7oE6SYvF0h1jD5zLyYKJThVCR3v1exeW6ZbnnLWiG5hAdffRoR6fR7OiNjPMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PhMhyL5S; arc=none smtp.client-ip=209.85.128.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PhMhyL5S"
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-81eaf3709b4so12889127b3.0
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501340; x=1786106140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTE1HjCQloV4v/Rut0+DoPlUP4dxL3XlmD11O1EpnDI=;
        b=ahGLetqTDRFeIb/5i0hzOYAcnD/pEgH7KgDrezIZDlsmJiTIUd6mZaLHKrTiQDH03q
         gReOrJ9g+ASPaK6MMvNTPaZ2iFmlhmiOVZIfQuiKkdGJmBN6iD7eyt4x9d+TmXr4Rjzx
         8HshUs+8Sm6VgT5UD2JzUNK8ir3nsx1Jj43w72dLR5Hnt2aJoTeyKtQwh0SPqN9zA2wP
         T+q8qvMe4WZnKZ5zh1V4EcbA/v124ZCcvdkB+WRL39aLF+4IwG45CHHZvlx+JymYlYfC
         JtdqdSiHpF6m60px7IaD5zuL+QaiIlLYYnf1ASMJirU1+WlXrOOCO1V01L5p75bT5m1G
         jjKw==
X-Forwarded-Encrypted: i=1; AHgh+RpzFwEynhrfPXkBWelX44k8D+KEMzdoF1ysExTHj8jUcMHef51fkDua5e5XO7oT+trnA1Z3U+Uw7z4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuEF11BhQl6wX0gpnVlXQrEx7JQFvqiL33irv7v7gPjMkVU7Bc
	2RRY0pEOlSOSPJA61B1rV7hur4xcE5dpHQIBGt9RJBaj+Y3QkdCNNJ/px7VMcU0lptXylfiWSz7
	6ZUGnBElcjVddAqdZj9Ihf2RUEBkOdvBwVAF4mdFyp1gAomq9PTb3sUdF6ZigJK8uzHMmcrxH9E
	WvEeh+46I3WTWTt9mf2IQ73ZiJRjf5sTpFwEtpkw3d9ukCMk3VoM0TFBYpODOlbOe6fB6RXMQ7U
	Nb/bJJtEsETkZT/sHJ+fA==
X-Gm-Gg: AR+sD139EgiTQxZw6kapBb3lojWCma3UnE8UEV+ukyqH8NoYzypKdq3Wp6mxECpHTas
	9/r4FLeCo2eb60NRtmn3KU5/hJK8zW9S2qFYxAdr4p1HD8nQd5v6SKsVqNKf6qnNSI9SXN6eFhx
	i0zHaAh+k8eaB8yfDrgMerHT8HXplt8zg5Ubcpn5zwkxkdVi33UtwfkU4+RAZgusbECcUzoeDPq
	MqrGVy9Jij7y5Ib0TjupRnFbQn4XLI8lYrGd0GczmjUDiE7LwBCG3h4DsUg+iD4mjWP0Qj5yEUq
	wryEGEmR/xI25AGj/B/yH2kjpRLlDUp4uBqqwCAaTFNupDuUE8gqkxB6/l825BmYnY6TWCovPjl
	nfsww9eqcEiHcgfU6nG0P+5BkCUSWEB3+/wCDyqmIoLuoO/jzxbYsbNyFoKTKH7dgWzAE6Hll0N
	I8kQUpmoczUQjt9uBJ/VT+Lwtsc2Nomj7ouMILaCs=
X-Received: by 2002:a05:690c:968b:b0:80c:5ce9:8f1a with SMTP id 00721157ae682-81fcc12394amr14252127b3.34.1785501340306;
        Fri, 31 Jul 2026 05:35:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-81fccf6e8easm600007b3.11.2026.07.31.05.35.39
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so1614417a91.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501339; x=1786106139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTE1HjCQloV4v/Rut0+DoPlUP4dxL3XlmD11O1EpnDI=;
        b=PhMhyL5S5CIGczfjkkHXNMVF6Gkm59OqjD5q7x6FdvVfZo0tMdOlyYGUz0usqy4yzF
         X6moPRNrJ/gcsVhG0o795eaOwV31FBTvdwuuwUCC9BYyy+YJU+90MWdud4ax6QrHfeGt
         5MFFRau3+DskCIbVwIogwXmfcOCEflC9ph7aM=
X-Forwarded-Encrypted: i=1; AHgh+Rr5HCdYLvSjWwQNvILWT8ns9Ov0GHQSq0jRE5MKK+FWVSDS775mp18YTiR+Nkt6o3ieTXlkARfEfH4=@lists.linux.dev
X-Received: by 2002:a17:90b:5844:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-38fb1147403mr1759611a91.12.1785501339027;
        Fri, 31 Jul 2026 05:35:39 -0700 (PDT)
X-Received: by 2002:a17:90b:5844:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-38fb1147403mr1759595a91.12.1785501338586;
        Fri, 31 Jul 2026 05:35:38 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:38 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 10/13] wifi: rtl8723bs: use pre-assigned cookie for mgmt_tx
Date: Fri, 31 Jul 2026 14:35:06 +0200
Message-ID: <20260731123509.1975281-11-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
References: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Stop using params->buf address as cookie value and simply pass the
pre-assigned cookie in frame tx status. This implementation seems
to fire-and-forget the transmitted frame as the cookie is not used
in any other way.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 6a97afd89dc7..0e6b40336123 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2552,9 +2552,6 @@ static int cfg80211_rtw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 
 	padapter = rtw_netdev_priv(ndev);
 
-	/* cookie generation */
-	*cookie = (unsigned long)buf;
-
 	/* indicate ack before issue frame to avoid racing with rsp frame */
 	rtw_cfg80211_mgmt_tx_status(padapter, *cookie, buf, len, ack, GFP_KERNEL);
 
-- 
2.54.0

