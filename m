Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE743909B8
	for <brcm80211@lists.linux.dev>; Sun,  2 Aug 2026 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659964; cv=none; b=IOB8rRDALKaU68mQLsCh5Z3r7U61Ig8R1sV1XfxOi5kfSKW10dbrXiT7g/E5FSA3QYhGIsgfFEQw5QKJKRlsCl/qM7LkoZPH5B8N2Vl36ZT+hQS52Hf3QFsq3CtS42cLd3KvOWUPbDm2L32BvctzuydWcsUIZ9wOchVhEZovfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659964; c=relaxed/simple;
	bh=oDoM+/kafg5WMLv7D3QMC31ArtQ7F9a/PGEZvbw8C6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptrzQvax7ddtuB/z6kACxKr8hznGaPvC/tyT6fSHjO+FmoXjIEdrFMZVx7jT3QhSRx/7+ORriREqRYxt0k+SQN1IKRuSmo55IoVXB1m/ilWmAdbChJSsP9hEHdNcC37+ktFKvjBoheBxf6Dh4hWzipX01HwpdXCJkCyX11CA8cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IXNd1SFw; arc=none smtp.client-ip=209.85.219.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IXNd1SFw"
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-90004d2f7b7so26841106d6.1
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785659961; x=1786264761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sh/ryW93h595xQs8WsIHCf/E5GVTDNcp/Vf4OJp+tiA=;
        b=L1XfNc4Tx1zaZsfyYJpTsPNfCQ3IAOvPJMYgyOlLKBcQA9CJHY1VpAuWMTbEld3LST
         Jdxl541a4qhigJVrp6v5IYFRYNcT9gYawipms+6Ar5cjvB1qs/XvTFCQ5fO3D5oME8g0
         kTxf/Gt+lfNn6llcNsMxj1QBXxj1OREos8/5VmbDNJ4QcFenvaagDgRvr6n5isCzPJgM
         Tr9EUdp73tqZgdZZ5jlDZRwbuCy0z9h6+8HDjR4c06JN7YzkHmedOTme2725uhjzU6kf
         HW5FD6HjUyIitOKbxa7SSOu/6sHxawRkfKA/IotdKkkFs0APx3jaIWv2PglwUJ2IfDoa
         lK5A==
X-Forwarded-Encrypted: i=1; AHgh+RrClv6frj/zBq265eu+zU/0goqRRJayr0LR5D+GL5TIqmq+FPE6O4LBLpH4CG2vqj/Bi7ludIHORUo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyR6eGmhEq+8VX8+/iIC5mq5lm6umgXl7gz9CFf6zr3MdsNDFZs
	EqG+AD13GePhz+2odcZF/J5Joqu1cA0RH9l/nXJtSkRsMKG3VYj/1oizQU7lpGTaCTZ4QmrjMlt
	Y5kdO85rKGyoVuybCAMFQzojG+ohW7Gsh8JDLPHDvmn20MpjN2IhEbc1V3rlsK5SOAIxTp2PnpP
	s4q5uilUL9EvaoN9zjqEN7eQRwzrHHYR9RQmkIKDGx1XFUfAutCn9z0qtgSqC55ZiMJhFmpwT6o
	whsSbgAgkTnTRGr/GDgPw==
X-Gm-Gg: AR+sD13/ZgEopWciq8jjp1AhL7mm/y9OzGkANK5TG5vV2i9swtEl695ljbqg4+65/5W
	EPP+ZPkOIMHwidV5zErlIVm6cXB1z2AVhGSZzWgnOIfJdWNgj1IhjUROPyU2yGEuCXiitKfiO/j
	2zvo9pU37hIMM3p2jYAuF8y7jJWG6JHESOkHQ3mg3P3aNhbEXWapp2wGSFJENV7xwS01eqjmNMM
	m1ty/+lh9HOc0HFeXcS6aQXChUlpVY6kSVfCVghI0aBLErsrmrza9wSh2w9d0bEEiUGdoXaZUBS
	r0QJcdvAhjRtWpxE5vdjdyH6PJD07m9J5+qVd0mU8unS9qQg5EPE7yLgkW1yq8qjSlb+6Y2YaGA
	gnZrakXTHc84bCbJOd4CPTQw3dmZLNi1biV4n9QKiLgRYWJBCpo+7AGwX4iSZmwYa6PwAf1dAfB
	Kfs6Dk2KlO37XdoCDfICzCX8r58ijIzUaDUetXdDk=
X-Received: by 2002:a05:6214:3982:b0:8f1:d3ee:a8f5 with SMTP id 6a1803df08f44-908496341b5mr142543156d6.26.1785659961035;
        Sun, 02 Aug 2026 01:39:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-908435aa6b3sm4415836d6.17.2026.08.02.01.39.20
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:39:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8db414c7so33891161cf.0
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785659960; x=1786264760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sh/ryW93h595xQs8WsIHCf/E5GVTDNcp/Vf4OJp+tiA=;
        b=IXNd1SFwoPZeW04sAd8BRS+ZvVDKvPgUWj3vGwU59Z0R2fWZ3ymGWCdtxA0GxIPWNK
         B0WhNHn2CKjHO1M+pzvcg0qFBffzn+NDnfWTWaZClEiYK80fYlmJpr77ePHy0uc/rou2
         aCuxtFVSC2HRbH9zQ5A35HD0z2PjoG5JZwJAE=
X-Forwarded-Encrypted: i=1; AHgh+RrbuOXJJIG8xZDENo/sqvg2DDLfBChBgEDYOWbgkMG4nUkuGIh/S6doHOMViu18Vy0HQeFGtJk110E=@lists.linux.dev
X-Received: by 2002:a05:622a:1aa8:b0:528:32c0:8237 with SMTP id d75a77b69052e-52b567cfad9mr117237001cf.44.1785659960309;
        Sun, 02 Aug 2026 01:39:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:528:32c0:8237 with SMTP id d75a77b69052e-52b567cfad9mr117236841cf.44.1785659959906;
        Sun, 02 Aug 2026 01:39:19 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435def8fsm49457956d6.38.2026.08.02.01.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:39:19 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: brcmfmac: cyw: set a unique cookie for mgmt tx
Date: Sun,  2 Aug 2026 10:39:03 +0200
Message-ID: <20260802083905.3819981-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260725014411.170340-1-bogdan.nicolae@gmail.com>
References: <20260725014411.170340-1-bogdan.nicolae@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 24 Jul 2026 20:44:11 -0500, Bogdan Nicolae wrote:
> Set cookie using an increasing atomic counter. Avoids mismatches of completion
> events later in brcmf_notify_mgmt_tx_status, where packet_id != vif->mgmt_tx_id
> is checked.
>
> Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

As agreed I will mark this as superseded.

Regards,
Arend
