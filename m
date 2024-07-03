Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3371173345
	for <brcm80211@lists.linux.dev>; Wed,  3 Jul 2024 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720012999; cv=none; b=oMFG5dnwCEY7JhethuKLxBh8kgE+GtmhkKF9lNLvyhWY0z9LfyftVIFZs+X5bS0JyUSSmnhwWP9ZaCOOP27nu/Wkk+oQvzS7ST+jUEdXC7v7PXdrArjjinBs9F6k2HCphMuVxW+AEY7/B0iCYEAhOxEzO1x40mcpsHpEmCyFHns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720012999; c=relaxed/simple;
	bh=XkZ36YVkSCYdsa2PZ9dd8KTKzlgKsyNmSOvBW6fXlRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGvI4yRSyzhDi3Jfi8lE3rWjNlGcgxzmDCgPlBCW5XJ/aTKiFSBUBtF84ZyJ+F4OKJyqc/vxRod3opfvM6CRoXP+NLtzjq1cvupGD8dIHQ6La0b3GdnVib23FODuBWyRhx0Q2rRiH3QQ+e5k3Hi1deOnKd+JXa/WXeYiVtiFyVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AeUxyes3; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AeUxyes3"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5c21ef72be3so2927153eaf.2
        for <brcm80211@lists.linux.dev>; Wed, 03 Jul 2024 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720012997; x=1720617797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u5g2d7cGxt5LUhs3Ln8D9odUoDF0lLXQxROOlmlLiFA=;
        b=AeUxyes31tbMPkEo8w0SRx4JSQK1YpiNW0uMzSjcvJmZBFlgWKKxpLcBlCUiVVRHec
         zGVh/11Vu3PnTpjKxANSKvTulLCq8TUdXixx5UC9mJelmMFSfdVeq7n1PJxMcdVH/CFU
         NelH8zV/ry4uniHfNiUt5BfC9NInxDtfyQtycxaIDB/sesktjMC91T+pKa9M5+Y+mRNe
         luMrU1A0Jhi158CiUMleQjYVRWKGIKHOLH2/Tr8J2M/sUyYItdVPnlYfpWo3PkmwAJTf
         0vyULCubPgrAmfpWwFrhbZqU9G+ZEooZLHmfRxCjzuPtDH6pTO6VEeRKxioJ0ufW55zT
         4JoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720012997; x=1720617797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5g2d7cGxt5LUhs3Ln8D9odUoDF0lLXQxROOlmlLiFA=;
        b=BH0l3k0FledBpo0if/eWiZpdvQX1MH9ymSO7NqqPeyqJNLERrr1OE57jxre7S6OU6P
         x6UiYbdy24V821i/34CZLxX4W6g/7xR/8a/XEsT0UYxK4QLJxqO37MoA4VQHK8pxfvRK
         ydE/6D7EWZjx22CKFlyPy8pe6kExDxKcpuHY15K2ywMcUKYW6JPD0kZxs2hJfYx4AFVu
         z8OpR2bxbtL8r/UO8WFt0V9vRC5CAlB/wtsMXhLhfM0PY5+P75H1Hg8wvmqvHa8Bn6iO
         sVEtVENGuLKbT/iNPiWWDmjckR4KaZ7eUMaftUNekAwM2rvhvzReRZpEXwAw898memBt
         05Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVhSCYvGPodYGhFFH14xPOcD5nRYrmUKJHZYdlREepJE4hN0gHIfNowEjH6k5ppEGiZUJIcqivcPTtYnR8qW4XuOBx9CcCk+Vz9
X-Gm-Message-State: AOJu0Yx3N9qJ6hUxJRqf2s/ILAStSLNNq72pXKl5YbP6y0E5MNUYj8h/
	ESsT/GKPW1YoHMZx5dODnWzRXuF2V5/UaNpLlb98TRxdw0wA33MkWcxEqp5wK3s=
X-Google-Smtp-Source: AGHT+IGplWSy9vOCLJA/qnz+gTqhZnkdj7xlESE8azCcFRv+VtomZcElQ/dKFnO84Qfq84NOw3z4Hw==
X-Received: by 2002:a4a:4884:0:b0:5c4:fc6:c7f5 with SMTP id 006d021491bc7-5c4390512d7mr11084414eaf.5.1720012996656;
        Wed, 03 Jul 2024 06:23:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c46ae49decsm327881eaf.24.2024.07.03.06.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 06:23:16 -0700 (PDT)
Date: Wed, 3 Jul 2024 15:23:14 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Su Hui <suhui@nfschina.com>, Kalle Valo <kvalo@kernel.org>,
	johannes.berg@intel.com, kees@kernel.org, a@bayrepo.ru,
	marcan@marcan.st, quic_alokad@quicinc.com, zyytlz.wz@163.com,
	petr.tesarik.ext@huawei.com, duoming@zju.edu.cn,
	colin.i.king@gmail.com, frankyl@broadcom.com, meuleman@broadcom.com,
	phaber@broadcom.com, linville@tuxdriver.com,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH wireless 1/9] wifi: cfg80211: avoid garbage value of
 'io_type' in brcmf_cfg80211_attach()
Message-ID: <3f7bcda7-092f-4d94-80c7-2015e860fbe2@suswa.mountain>
References: <36cef2a8-10a3-928a-d962-3599333d9ac8@nfschina.com>
 <19076e6bec0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19076e6bec0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>

On Wed, Jul 03, 2024 at 06:42:32AM +0200, Arend Van Spriel wrote:
> On July 3, 2024 3:42:18 AM Su Hui <suhui@nfschina.com> wrote:
> 
> > On 2024/7/2 23:39, Arend Van Spriel wrote:
> > > On July 2, 2024 5:29:27 PM Kalle Valo <kvalo@kernel.org> wrote:
> > > 
> > > > Arend Van Spriel <arend.vanspriel@broadcom.com> writes:
> > > > 
> > > > > On July 2, 2024 3:57:27 PM Dan Carpenter <dan.carpenter@linaro.org>
> > > > > wrote:
> > > > > 
> > > > > > On Tue, Jul 02, 2024 at 08:24:44PM +0800, Su Hui wrote:
> > > > > > > brcmf_fil_cmd_int_get() reads the value of 'io_type' and passes it to
> > > > > > > brcmf_fil_cmd_data_get(). Initialize 'io_type' to avoid garbage
> > > > > > > value.
> > > > > > 
> > > > > > Since you're going to be resending anyway, please delete the space
> > > > > > char
> > > > > > from the start of the line.
> > > > > > 
> > > > > > It's weird that brcmf_fil_cmd_data_get() uses the uninitialized data.
> > > > > > It looks like it just goes to great lengths to preserve the original
> > > > > > data in io_type...  So it likely is harmless enough but still a
> > > > > > strange
> > > > > > and complicated way write a no-op.
> > > > > 
> > > > > Not sure if it helps, but I tried to explain the reason in response to
> > > > > patch 0 (cover letter).
> > > > 
> > > > Would it make more sense to have just one patch? It's the same issue
> > > > anyway.
> > > 
> > > Yes, but I would solve it in brcmf_fil_* functions (fwil.[ch]).
> > It seems you will send a new patch to solve this issue.
> > And I guess there is no need for me to resend a v2 patchset or just one
> > patch.
> 
> I am not entirely sure. If both gcc and clang would warn about using
> uninitialized data I would be fine with these patches rolled into one.

We should definitely fix this, it's just a matter of how.  UBSan will
also detect these at run time.  And honestly, it's not clear to me where
these eventually do get copied to?  Is it to the firmware?  In that case
it might be that we'd treat these as a CVE.

regards,
dan carpenter
