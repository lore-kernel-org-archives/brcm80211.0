Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769135;
	b=B7uz64d3294g+UxVhWuE5G7NuNxXFH6+OlTLzY1AYR6V3nKmCh8cL0JWFmL9pFZQc7XD
	 khgeKynHMlhZjA9kI3FYkY/ROxEE5aXeah1PNowj+dbTjULc4jrDEC7Guvq23R0PuPfOw
	 iYCZ+ZkvMSQkNBpAbG6ZKdyVzk1ktawwfUXf+58e7YqfkypTwVkZ31jj2ST5IxtSw4AVn
	 cD+/KM1+iOtO7HZFJlmQcPk6aA1O6mBARqxRNeuP7drnriJITByfjXSf4YqmEgqE0Rq2v
	 BPv9FooywrtlIVg87HbpcLYPG1Pfeo0p4B+ini0M1eSyBC9u7wjPypnMRSVfUth2HQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rfx8/QKieNzWuOWEnTbfc0MHqfPFCPFKkwmu9s+LsEQ=;
	b=alu/oruveyMYbF2Qjwz0vQ/PWnvZpC/J1kkRMoCPTFiDc7zzVz04P8jUAyqlJLDAdomB
	 u95IxdaFKd41F+sV/F0A5PHzmzNSumrcjGsilHFGOy1hmtjgcTXsj1jH8/Ge1iUAAMH2e
	 CyM4W8PtXwzgQa4aIPEL3Dh/seQBBgmhGOBURD9oej1aeIE74OP0blAzoX58WvT/g2O+Y
	 AXL0r81Bwpy9BHc7+atu+cfvXsWh6nTPxpdouhnHCubEH1y3VnpH+5MscE8pQGnUoBuua
	 IbsJmmPGcm1W+ciSj93YOG18z+dXI8uySGjZbqhIQQZ0l+jL82hwNOELm/et3AjvCUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLoZcsOq;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0570606A8AA
	for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 18:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0570606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLoZcsOq
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f6295304dso2130777eec.1
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 10:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794769134; x=1795373934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rfx8/QKieNzWuOWEnTbfc0MHqfPFCPFKkwmu9s+LsEQ=;
        b=rLoZcsOqKBb4z7z+fJt4Uz/aeynaPHwFmxielz/dPeA08noLwzj8hcm1+UJh57vMNp
         PyTGkI0IQnDHICHwRyYNz4e20X+CFzErpmdaf1+zQoxoAm1NN1MzdG4/Hsk8kfdnUqwL
         MtTobHoMsW/0SbTP9Uq4eiP5aCmvMTJlfUpiw9oq/pojwI/AEnufpCYWqZ1AMQ0y4hIU
         EDpjJCvvHFpXV3UOB05QNVBT6LghdMN1MFtH4ufncxdJnMTFcQd/CzRdNWBfxrfd7dMU
         EGz7sy9pgnfcWT0h2O19VyLvevKGy9QniMy91XeEJ6+HR0cF+l3c3viV01ZjgHNQTId0
         tqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794769134; x=1795373934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rfx8/QKieNzWuOWEnTbfc0MHqfPFCPFKkwmu9s+LsEQ=;
        b=I99lXNVzk1z0pL+6IoHywf+Wy5yEeHpmzddlUr3WZY9p9za8E9KrQDQByOmEAkZdwf
         yHZdWU5UEhSPHg7gH7jABiS3u+RMJWyFo2MpnIrDGAY8/BUAGS8Bh4q8r1rZlBvqdrNg
         4v89ldZNQZYATEnFSiJvV1zoG+BM0hP5i+8sK5i/XGfup39mDSHdyINDd38B1H+/JEda
         QE2ePPpVKSn6aILfWmKz7LkDITgPFdNzUiyGgc1sn8MXmtM5+sZVodP49STWPoOoX14b
         Xf7VjiYmshyPMcIQk8JBU0ohxvwOHo8e/y+Cht/E9jQGA4PFrBiz4H/dpcLcA/ogd3dz
         WLYw==
X-Forwarded-Encrypted: i=1; AL+hErEbpw9HPKS+g8rqCrnC4OUu0a68AnLvvrPDEkDjX3q9poWVUzSzJejxzQoVTgxAtMEe+i3vE/P7wlc=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Ll2EidOSnzg0nuNzzo2zPKdubLC5kvlrv82OQqXt4ONw6yKAk
	26RUMMtc06g1FfcEYiFFr2/cECjJKJFWa+x5uAk7P796Dag2JsEgvCku3i+NR9Hr
X-Gm-Gg: AYBFou0cw/MD0vtKp0HBdpFYjaAXvZKl7e9ZFN2LijeLTBUHXaa3HtxVtFbsrdLWsxY
	zIG/A9M70pwb+tKJRwiXl73dXyhwdAn6UpLVSihMJkA4S+mStn2+wv2mZ1ZLgI/ZphNUCNSTt7/
	A/zUTTeFuzwuitmXdPwKxAT8C5x51yr8eKj234l2EhThYtapr15tCAs78a/r77bOgluti40zNNn
	mLGcsFNyp9afUVZdCnpSDEJYzlV1fg2J67hP4Sl4/KJodcSaDD0iBb+cAlNVd0ypS0t88TTpBFu
	XKN6RvKtchyrAlR6NcXCwc/kOfiZD0baj2spFmvJzTaqIGMiUqIlnMKglCkF/kN98xR3yUY7hTx
	nmx8ZQb4go+tI/u1AxGFiTaI7pfWfett4GkZWbcaheMeyBy8ujzDdEOZgWreWLisx6urS4QaLRZ
	Mkc2hfpj6a/923FHP4LSbEYEfm9yxWEj+7sSKBurerJ+bYYCxXlgL7CpNximNVEMp35RcWkun+M
	pps8nKIoJ3fu9bt68cUTdIOOs1C00s9U8lJIiE2wQkswWWAiwWpPrAnwumg4wUMMVoUYNP8osKx
	AceY0A4iLPkNg8R52qrgx89x7KJ6YggNxMRAyYCbfNLoPGmTKbRHi2+7r8L4e6MDgOhFiTZXfhQ
	=
X-Received: by 2002:a05:7022:8f:b0:191:444:425 with SMTP id a92af1059eb24-1b50306832fmr7755064c88.2.1794769133806;
        Sun, 15 Nov 2026 10:58:53 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm82306c88.0.2026.11.15.10.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:58:53 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless 2/2] wifi: brcmfmac: fwsignal: bound the MACDESC_ADD interface index
Date: Mon, 16 Nov 2026 02:58:43 +0800
Message-Id: <20261115185843.64633-3-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115185843.64633-1-maoyixie.tju@gmail.com>
References: <20261115185843.64633-1-maoyixie.tju@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_fws_macdesc_indicate() stores the interface index of a
MACDESC_ADD signal without a check. brcmf_fws_macdesc_closed() later
uses it as an index.

	if_entry = &fws->desc.iface[entry->interface_id];

A device that reports an index of BRCMF_MAX_IFS or more makes this read
past iface[]. On USB this parser runs with the default module
parameters. Reject such a signal as
brcmf_fws_interface_state_indicate() does, and count it as a failed
update.

This was found with a static analysis tool that we develop. A userspace
harness that compiles the fwsignal.c functions unchanged shows the
out-of-bounds index under UBSAN before this patch, but not after it. No
hardware was available for testing.

Fixes: b75c1a301b7d ("brcmfmac: destination mac closed when interface is closed")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index e81105154d6543..56eb2c2943dbe8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -1010,7 +1010,7 @@ int brcmf_fws_macdesc_indicate(struct brcmf_fws_info *fws, u8 type, u8 *data)
 
 	existing = brcmf_fws_macdesc_lookup(fws, addr);
 	if (IS_ERR(existing)) {
-		if (!entry->occupied) {
+		if (!entry->occupied && ifidx < BRCMF_MAX_IFS) {
 			brcmf_fws_lock(fws);
 			entry->mac_handle = mac_handle;
 			brcmf_fws_macdesc_init(entry, addr, ifidx);
-- 
2.34.1

