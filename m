Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485171BBBF7
	for <brcm80211@lists.linux.dev>; Tue,  2 Jul 2024 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719934632; cv=none; b=DFTSZ9qCKeWaYCnm1V8WBaSa5JP4UuORP6XMpVaaaO84dcDFdUe03Qfn77G/Y8JN+duFknHRkJT0nJF1supZ9OJiikILAiU8/mmaqwpZVtP0v2ftocDKOZXr7yIwG8CmgwekbaVjsUuyyoIdMgZHagZObGUd0mZumkXCJxrWSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719934632; c=relaxed/simple;
	bh=dQc3tYew1AZurSoAlwOVz1tVJUNzfbYnzsDwt5Len+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMNQzaIJrU5h+zudWTldaU18Ehs08Sb874pD+w7Yubka/eGYltugGXshfL+T5ENCMrfhGRnje6o40HTBDw6g8t5HffZadjCJoUkDSrueDtRs8A5qNZd2InUcxH4g+Ef/Z7AaONXARhuokIZsHrh231ZQNt2Dyve4QwQQvPISeXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDbzKUTc; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDbzKUTc"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7021dd7ffebso883478a34.3
        for <brcm80211@lists.linux.dev>; Tue, 02 Jul 2024 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719934630; x=1720539430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aVSAscJsJjawbJOjNIIGYe0PRN71Kp02pqdgWCt4bXw=;
        b=TDbzKUTc0DlhJKyhpVy9Vudqf/3LVerrFSJApiSpv3OmUcUuzXrnGLRI58sAecJJdO
         BzeopDH7A+d+nLLEHxJY8JT9+qAthlAGjIX0XnWEye7grsnuvMPhNTqezQ6uUYe+ckGy
         bjSTOhEGrWzLTz48ko4z3yMsrYg9NkCS/1/64KS5EZ6w23DQep+1MxSTCTeYn08h8GOh
         s2mqLaXN7UPPG78YGFNwCk9oIOpddOaDZh75WLTFwCGy20/9v1x5DFeX/Pj98NBoGML6
         Nq/8hnCMTLjZqK1hpzxGq1E/J9BS9APoxc87ajF3estw73X3m8I3REXfuSR6/oWJMyg6
         0AUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719934630; x=1720539430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVSAscJsJjawbJOjNIIGYe0PRN71Kp02pqdgWCt4bXw=;
        b=UfmqAsrCSxKeo7kFFAJMOD9S5KrVPb9RAOqtEaGB9YHwI7hvCg8uGvaAAGS5nArPBu
         zAXVsGCo6PsiiFNFQYYhZT7xw4kBN/BPNKbscFGlU6QOxt3eYqpC6KPY2If2iNJ1zkag
         55D8VR/nqLMkCJjgSRcfYvMvR/XY02mRzum4qQQ+vVebCMsGI2ER8n/qZhtqMTfuC/PP
         ZqL/krZF+lRiDvC99FRs2YV1AC+E4Do3gzb4JwkhoTzQ0gnTiG60XNyfb//yPPcCY+8f
         ybAwXnMLO5MdIu6+VKDESQRKcexUIsYyvgEcoWU3ZEheBaJzGHM2MbcenYkvYFls7yZe
         qTtg==
X-Forwarded-Encrypted: i=1; AJvYcCWqtF8Bg/biR9SCe639w4wMnjtbb+5INzXKZoeaDrMzJyN0ci/VK80D/8Smep0DpkCxfESGG/NwCHCP2ImlF+3l0KU54Iw5usnQ
X-Gm-Message-State: AOJu0YxxsgSpbSYCcWXFzbXfpwTu7fjBz6Bky6Ha0l4YC1+tZZ70Wcv4
	puJDSZfwy1yi+8uoNd03wDixIPuGuM/ZsBJZ7tRjmr2Ea22y1ZIHpTwKJz/Hi+U=
X-Google-Smtp-Source: AGHT+IFMIUm5t6dN9PzC0I8I0TadK3ts/fipkldg0xShDih4b+I3MtsFtps46SCU+i0L3AuqZ01sAA==
X-Received: by 2002:a05:6870:4413:b0:254:ccac:133e with SMTP id 586e51a60fabf-25db36c36f9mr7911251fac.56.1719934630414;
        Tue, 02 Jul 2024 08:37:10 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25dff4c6b11sm152928fac.5.2024.07.02.08.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 08:37:09 -0700 (PDT)
Date: Tue, 2 Jul 2024 17:37:07 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>,
	Su Hui <suhui@nfschina.com>, johannes.berg@intel.com,
	kees@kernel.org, a@bayrepo.ru, marcan@marcan.st,
	quic_alokad@quicinc.com, zyytlz.wz@163.com,
	petr.tesarik.ext@huawei.com, duoming@zju.edu.cn,
	colin.i.king@gmail.com, frankyl@broadcom.com, meuleman@broadcom.com,
	phaber@broadcom.com, linville@tuxdriver.com,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH wireless 1/9]  wifi: cfg80211: avoid garbage value of
 'io_type' in  brcmf_cfg80211_attach()
Message-ID: <3071fd19-5cc7-440a-8184-3aeeb81c96e0@suswa.mountain>
References: <20240702122450.2213833-1-suhui@nfschina.com>
 <20240702122450.2213833-2-suhui@nfschina.com>
 <ba67020a-04bb-46b8-bc05-751684f71e8a@suswa.mountain>
 <19073fcc9e8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <878qyjg6cv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qyjg6cv.fsf@kernel.org>

On Tue, Jul 02, 2024 at 06:29:20PM +0300, Kalle Valo wrote:
> Arend Van Spriel <arend.vanspriel@broadcom.com> writes:
> 
> > On July 2, 2024 3:57:27 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> >> On Tue, Jul 02, 2024 at 08:24:44PM +0800, Su Hui wrote:
> >>> brcmf_fil_cmd_int_get() reads the value of 'io_type' and passes it to
> >>> brcmf_fil_cmd_data_get(). Initialize 'io_type' to avoid garbage value.
> >>
> >> Since you're going to be resending anyway, please delete the space char
> >> from the start of the line.
> >>
> >> It's weird that brcmf_fil_cmd_data_get() uses the uninitialized data.
> >> It looks like it just goes to great lengths to preserve the original
> >> data in io_type...  So it likely is harmless enough but still a strange
> >> and complicated way write a no-op.
> >
> > Not sure if it helps, but I tried to explain the reason in response to
> > patch 0 (cover letter).
> 
> Would it make more sense to have just one patch? It's the same issue
> anyway.

The Fixes tags are different though.  I'd probably leave them as
separate patches just because of that.

regards,
dan carpenter

