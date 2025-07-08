Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B563E2A1BA
	for <brcm80211@lists.linux.dev>; Tue,  8 Jul 2025 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992354; cv=none; b=BV12iz42cwFmYfAlLakLhjmVPA7drYkutVpPPiPlB+mjIqjA+ow8KhnMpz03XMzqIYycsxg+LrDrUx7epv+KpqiDP1BJlth0IJ53R4D6G4pnPY/uRxGvO6KEII/RTWlkTIoy5EAB+9XUj+Vd8lsG78LgdoNIkU90PcJb4lt5s2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992354; c=relaxed/simple;
	bh=LTzyrlVRC2NuGEvU6komTwWkbLgRafPqLsS/yPoZMsw=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=iv6Ok8wkk5YH4XfvD4Kj78izlBsmYJmko1NirZD3WVgQxAxpSGyjZ7BpVvwvJUUfySNY6N+vEKuiqeKDpZPpcy3STlrkRc3bYy//kuD+5XmjtGudLyBhaaHcjrkGi0CrB7YYJFJ8p2DTb1L4oeu5vKV3ZkSuEe2idgVwyGRqo4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fBP4XpN7; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fBP4XpN7"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so6261627a12.0
        for <brcm80211@lists.linux.dev>; Tue, 08 Jul 2025 09:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751992351; x=1752597151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MJ4iLePVOAeT1UDeQoqVaF2Z5OTuK43UIvQovAJU0w=;
        b=fBP4XpN75j4QeWc/+Xj8TkGwZkE70lkkpi9/z3J5lPHgAtzj6E3u3QaYXr+0EI6ocr
         vz3KjpYTh0wNpqQT2JTMUFNX7ZqREuuZVSi9IXPcP9/0T/x3BVFyy/yLOHjOxs3KlK0E
         30QlweqlfII/HhLhxRBR4dlJu26XSellxW88I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992351; x=1752597151;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/MJ4iLePVOAeT1UDeQoqVaF2Z5OTuK43UIvQovAJU0w=;
        b=DtTdjyCRUrTw8MAPkyslD+/Dn44sRLKVDD3dRiWWXZ/hjELucmP/PYJvWMrX65giMf
         EDkWwiMuu754UD+c/xwJXWRfNO5LfnpIsCFCpAgjRRiK3syHE5uLA3zG2KhjUdMypbpy
         7r/Hhc5yqyLAS3zUAlgQ7HEYJwu4nistzxBHYxHGLSIXapyhZ2kJcAj/f09dp9T3QHzA
         CiDMvAcWtN+YL35gcwIW6kIRKwzUHoJ6g8L3e1LW96lOelPw6xmnkLvUILDkedErq1RG
         fdEEKx8NutNLXhww+apvaaHbiCurtvsKrlaUXJ9A/YJ8FOPhiEfVSkmmCVzAbQ+ZmKYk
         o8MA==
X-Forwarded-Encrypted: i=1; AJvYcCUawhlbZ+kQrRQKhqL4Y7mtC9O1gAGwKUs0g/GTd8W1bgp+W289bxtj2zpZyl0sgT7PHh4HMKC3gl0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfVNFPd9BkIfL3dpsrNZ4aNj6cOnQE50zRzWOPnD1OjeHSFmZy
	y/pujQYVo4UsvgkAbXHk5Y2IVW1/fZLGERpYpuXOMdOCHpCbIG15JcdMmU3ZLPe/FBjGWYN1cKc
	A7QlhN59y
X-Gm-Gg: ASbGncut9I6U85zYVXT1KRQprsgreoA5Me9Ufo08ikIEQCwKfYj11p+mZgGOP7s+trf
	qR1/WhoLzt0rEhb/rIANYPFhcNfdUXM8s1jnw9EVItSLWufTdzOjoS9YP6GikeDmumyyRhkMwNr
	sG1h15u/n3oh/k+HnQGHPiZy4iQoOo8TgvftSezKPUI8q5J4i/Bs8sWh2/GhSTcogk9cJj4i9qr
	9kR70/ffZQ45BvTHT6p7W9UFWEwkYBDzAVSt28ajGJxonWJivuKpO0yoSM4LsYCjckUn0mOnQvo
	ZObulg2hDOKa4oPz9z6KFAkohuesGeHATA6YiSnUN/BSdcm3Nlvo2bvzTxtlJh6/hVYSOp1lbzu
	fbe9+Y616sJFBHlQRVEia0ATCo1YyccArz60=
X-Google-Smtp-Source: AGHT+IFEYr46G/HdRQO/5D6woNuXQArSAZCNsPSloKDWTMd6bfLMS9lxuXY+ppM4SjF5LiwwebEeJA==
X-Received: by 2002:a17:906:dc8f:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-ae3fe7af792mr1598262066b.28.1751992350979;
        Tue, 08 Jul 2025 09:32:30 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac45easm914442666b.100.2025.07.08.09.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 09:32:30 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Rouven Czerwinski <rouven@czerwinskis.de>
CC: <kernel@pengutronix.de>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Tue, 08 Jul 2025 18:32:28 +0200
Message-ID: <197eae1ad60.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250621112912.180436-1-rouven@czerwinskis.de>
References: <20250621112912.180436-1-rouven@czerwinskis.de>
User-Agent: AquaMail/1.55.2 (build: 105502562)
Subject: Re: [PATCH 1/2] brcmfmac: remove unreachable poll mode for sdio
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On June 21, 2025 1:29:17 PM Rouven Czerwinski <rouven@czerwinskis.de> wrote:

> The sdio interface implements an unreachable poll mode. Remove it since
> the code can't be reached, if the poll mode needs to be implemented it
> can simply be resurrected using the usual git means.

Thanks, Rouven

This functionality has been/can be useful so instead of ripping it out I 
would prefer to have a proper knob for it in debugfs.

Regards,
Arend

> Signed-off-by: Rouven Czerwinski <rouven@czerwinskis.de>
> ---
> .../broadcom/brcm80211/brcmfmac/sdio.c        | 48 +------------------
> 1 file changed, 2 insertions(+), 46 deletions(-)


